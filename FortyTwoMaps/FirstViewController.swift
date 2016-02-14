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
    
    var LocationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        LocationManager.delegate = self
        LocationManager.desiredAccuracy = kCLLocationAccuracyBest
        LocationManager.requestWhenInUseAuthorization()
        LocationManager.requestAlwaysAuthorization()
        LocationManager.startUpdatingLocation()
        Map.setRegion(MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2D(latitude: 48.896821, longitude: 2.319774), CLLocationDistance(200), CLLocationDistance(1500)), animated: true)
        let fortyTwo = MKPointAnnotation()
        fortyTwo.coordinate = CLLocationCoordinate2D(latitude: 48.896522, longitude: 2.318515)
        fortyTwo.title = "École 42"
        fortyTwo.subtitle = "96 Boulevard Bessières 75017 Paris"
        Map.addAnnotation(fortyTwo)
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("coucou")
    }

}

