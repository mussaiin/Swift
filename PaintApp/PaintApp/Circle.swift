//
//  Circle.swift
//  PaintApp
//
//  Created by Nurlybek Mussin on 14.02.18.
//  Copyright © 2018 Nurlybek Mussin. All rights reserved.
//

import Foundation
import UIKit
struct Circle: Drawable{
    private var color: UIColor
    private var isFilled: Bool
    
    func getPath( _ center: CGPoint, _ radius: CGFloat) -> UIBezierPath {
        color.set()
        let path = UIBezierPath(arcCenter: center, radius: radius, startAngle: 0.0, endAngle: CGFloat(2*Double.pi), clockwise: false)
        if isFilled{
            path.fill()
        }
        return path
    }
    init(_ color: UIColor, _ isFilled: Bool) {
        self.color = color
        self.isFilled = isFilled
    }
    
}
