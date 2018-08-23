//
//  Rectangle.swift
//  PaintApp
//
//  Created by Nurlybek Mussin on 14.02.18.
//  Copyright © 2018 Nurlybek Mussin. All rights reserved.
//

import Foundation
import UIKit
struct Rectangle: Drawable{
    private var color: UIColor
    private var isFilled: Bool
    func getPath( _ center: CGPoint, _ radius: CGFloat) -> UIBezierPath {
        let rect_side = radius.rect
        let rectSize = CGSize(width: rect_side, height: rect_side)
        let rect = CGRect(origin: center.rectCenter(radius), size: rectSize)
        let path = UIBezierPath(rect: rect)
        color.set()
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
extension CGFloat{
    var rect: CGFloat{
        return self*2
    }
}
extension CGPoint{
    func rectCenter(_ radius: CGFloat)-> CGPoint{
        return CGPoint(x: self.x - radius, y: self.y - radius)
    }
}
