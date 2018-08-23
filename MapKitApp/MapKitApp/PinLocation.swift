//
//  PinLocation.swift
//  MapKitApp
//
//  Created by Nurlybek Mussin on 27.03.18.
//  Copyright © 2018 Nurlybek Mussin. All rights reserved.
//

import MapKit
import Foundation

class PinLocation: NSObject, MKAnnotation{
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    
    init(_ title: String, _ subtitle : String, _ coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
    }
    var Title: String?{
        get{return title}
        set(title){self.title = title}
    }
    var Subtitle : String?{
        get{return subtitle}
        set(subtitle){self.subtitle = subtitle}
    }
    var Longitude : CLLocationDegrees?{
        get{return coordinate.longitude}
        set(longitude){self.coordinate.longitude = longitude!}
    }
    var Lattitude : CLLocationDegrees?{
        get{return coordinate.latitude}
        set(latitude){self.coordinate.latitude = latitude!}
    }
    
}

