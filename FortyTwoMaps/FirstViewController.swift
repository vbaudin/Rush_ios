//
//  FirstViewController.swift
//  FortyTwoMaps
//
//  Created by Vincent BAUDIN on 2/13/16.
//  Copyright © 2016 Vincent BAUDIN. All rights reserved.
//

import UIKit
import MapKit

class FirstViewController: UIViewController {
    @IBOutlet weak var optionMap: UISegmentedControl!
    @IBOutlet weak var Map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Map.setRegion(MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2D(latitude: 48.896821, longitude: 2.319774), CLLocationDistance(200), CLLocationDistance(1500)), animated: true)
        let fortyTwo = MKPointAnnotation()
        fortyTwo.coordinate = CLLocationCoordinate2D(latitude: 48.896821, longitude: 2.319774)
        fortyTwo.title = "42"
        fortyTwo.subtitle = ""
        Map.addAnnotation(fortyTwo)
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
            Map.mapType = MKMapType.Satellite
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

