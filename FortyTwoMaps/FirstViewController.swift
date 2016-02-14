//
//  FirstViewController.swift
//  FortyTwoMaps
//
//  Created by Vincent BAUDIN on 2/13/16.
//  Copyright © 2016 Vincent BAUDIN. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class FirstViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var optionMap: UISegmentedControl!
    @IBOutlet weak var Map: MKMapView!
    @IBOutlet weak var GeoButton: UIButton!
    
    var LocationManager = CLLocationManager()
    var UpdateLoc = CLLocationCoordinate2D()
    
    var rowSelect:Int = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        LocationManager.delegate = self
        LocationManager.desiredAccuracy = kCLLocationAccuracyBest
        LocationManager.requestAlwaysAuthorization()
        LocationManager.startUpdatingLocation()
        if (rowSelect != -1)
        {
            Map.setRegion(MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2D(latitude: yolo[rowSelect].latitude, longitude: yolo[rowSelect].longitude), CLLocationDistance(100), CLLocationDistance(400)), animated: true)
        }else
        {
            Map.setRegion(MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2D(latitude: 43, longitude: 8), CLLocationDistance(3000000), CLLocationDistance(3000000)), animated: true)
        }
        var i : Int = 0
        while i < yolo.count
        {
            var tmp = MKPointAnnotation()
            tmp.coordinate = CLLocationCoordinate2D(latitude: yolo[i].latitude, longitude: yolo[i].longitude)
            tmp.title = yolo[i].title
            tmp.subtitle = yolo[i].subtitle
            if (rowSelect == i)
            {
                Map.addAnnotation(tmp)
            }
            if (rowSelect == -1)
            {
                Map.addAnnotation(tmp)
            }
            i++
        }
        Map.showsUserLocation = true
    }

    @IBAction func changeEvent(sender: UISegmentedControl) {
        
        switch optionMap.selectedSegmentIndex
        {
        case 0:
            Map.mapType = MKMapType.Hybrid
        case 1:
            Map.mapType = MKMapType.Satellite
        case 2:
            Map.mapType = MKMapType.Standard
        default:
            Map.mapType = MKMapType.Hybrid
        }
    }

    @IBAction func GeoCenter(sender: UIButton) {
        Map.setRegion(MKCoordinateRegionMake(self.UpdateLoc, MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)), animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        self.UpdateLoc = locations[0].coordinate
    }

}