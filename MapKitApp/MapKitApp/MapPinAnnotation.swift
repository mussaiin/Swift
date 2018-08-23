//
//  MapPinAnnotation.swift
//  MapKitApp
//
//  Created by Nurlybek Mussin on 28.03.18.
//  Copyright © 2018 Nurlybek Mussin. All rights reserved.
//

import MapKit

class MapPinAnnotation: NSObject, MKAnnotation {
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    
    init(title: String, subtitle: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
    }
}

