//
//  Model.swift
//  Animations
//
//  Created by Nurlybek Mussin on 02.04.18.
//  Copyright © 2018 Nurlybek Mussin. All rights reserved.
//

import Foundation

struct Model {
    let name: String
    let price: String
    let coredetail: String
    let camdetail: String
    
    init(_ name: String, _ price: String, _ coredetail: String, _ camdetail: String) {
        self.name = name
        self.price = price
        self.coredetail = coredetail
        self.camdetail = camdetail
    }
    var Name: String?{
        get{return name}
    }
    var Price : String?{
        get{return price}
    }
    var CoreDetail : String?{
        get{return coredetail}
    }
    var CamDetail : String?{
        get{return camdetail}
    }
    

}
