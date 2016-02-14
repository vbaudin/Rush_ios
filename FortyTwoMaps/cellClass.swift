//
//  cellClass.swift
//  FortyTwoMaps
//
//  Created by Vincent BAUDIN on 2/14/16.
//  Copyright © 2016 Vincent BAUDIN. All rights reserved.
//

import Foundation
import UIKit

class cellClass: NSObject {
    var title: String
    var subtitle: String
    var latitude: Double
    var longitude: Double
    
    init(title: String, subtitle: String, latitude: Double, longitude: Double) {
        self.title = title
        self.subtitle = subtitle
        self.latitude = latitude
        self.longitude = longitude
        super.init()
    }
}

