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
    
    /*let yolo: [cellClass] = [
        cellClass(title: "Ecole 42", subtitle: "CyberCafe", latitude: 48.896831, longitude: 2.318766),
        cellClass(title: "Maison de Vacance", subtitle: "Limonade et Rhum Coco", latitude: 43.329337, longitude: 5.098494)]*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        LocationManager.delegate = self
        LocationManager.desiredAccuracy = kCLLocationAccuracyBest
        LocationManager.requestAlwaysAuthorization()
        LocationManager.startUpdatingLocation()
        Map.setRegion(MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2D(latitude: 0, longitude: 0), CLLocationDistance(100), CLLocationDistance(400)), animated: true)
        //let fortyTwo = MKPointAnnotation()
        /*for item in yolo
        {
            fortyTwo.coordinate = CLLocationCoordinate2D(latitude: item.latitude, longitude: item.longitude)
            fortyTwo.title = item.title
            fortyTwo.subtitle = item.subtitle
            Map.addAnnotation(fortyTwo)
        }*/
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