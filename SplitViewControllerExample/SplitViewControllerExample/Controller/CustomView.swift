//
//  CustomView.swift
//  SplitViewControllerExample
//
//  Created by Darkhan on 12.02.18.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit

class CustomView: UIView {
    var current_shape: Drawable?
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        if current_shape != nil{
            let radius = min(bounds.width/2, bounds.height/2)*0.9
            current_shape?.getPath(center, radius).stroke()
            
        }
    }
    

}
