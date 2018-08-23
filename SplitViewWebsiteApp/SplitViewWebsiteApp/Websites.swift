//
//  Website.swift
//  WebBrowser04GH
//
//  Created by Darkhan on 30.01.18.
//  Copyright © 2018 SDU. All rights reserved.
//

import Foundation
class Website{
    private var name: String?
    private var url : String?
    
    init(_ name: String,_ url : String) {
        self.name = name
        self.url = url
    }
    
    var Name: String?{
        get{return name}
    }
    var Url : String?{
        get{return url}
        
    }
}

