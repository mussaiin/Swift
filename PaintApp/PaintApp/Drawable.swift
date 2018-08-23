//
//  Drawable.swift
//  PaintApp
//
//  Created by Nurlybek Mussin on 14.02.18.
//  Copyright © 2018 Nurlybek Mussin. All rights reserved.
//

import Foundation
import UIKit

class Drawable: UIView {
    var currentColor = UIColor.black
    var isOn = true
    var path = UIBezierPath()
    var initial_point:CGPoint?
    var end_point:CGPoint?
    var vc=ViewController()
    var shapes: [Shape] = []
    var shape: Shape?
    var ttt = ""
    
    override  func draw(_ rect: CGRect) {
        if end_point != nil{
            for x in shapes{
                var temp = x
                temp.performShape()
                
            }
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        initial_point=touches.first?.location(in: self)
        
    }
    func setType(_ tp:String){
        ttt = tp
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if(ttt == "4"){
            end_point = touches.first?.location(in: self)
            shape = Shape.init(with: initial_point!, and: end_point!, false)
            shape?.setOperand(ttt)
            shape?.setColor(currentColor)
            shapes.append(shape!)
            setNeedsDisplay()
            initial_point! = end_point!
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        end_point=touches.first?.location(in: self)
        shape=Shape.init(with: initial_point!, and: end_point!, isOn)
        shape?.setOperand(ttt)
        shape?.setColor(currentColor)
        shapes.append(shape!)
        setNeedsDisplay()
    }
    
    
    
}

