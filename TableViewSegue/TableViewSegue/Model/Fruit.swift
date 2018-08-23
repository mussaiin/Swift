//
//  File.swift
//  TableViewSegue
//
//  Created by Darkhan on 29.01.18.
//  Copyright © 2018 SDU. All rights reserved.
//

import Foundation
import UIKit
class Fruit{
    private var fruit_image : UIImage?
    private var fruit_name : String?
    init(_ fruit_image: UIImage, _ fruit_name: String) {
        self.fruit_image = fruit_image
        self.fruit_name = fruit_name
    }
    var Fruit_image: UIImage?{
        get{
            return fruit_image
        }
    }
    var Fruit_name: String?{
        get{
            return fruit_name
        }
    }
}
