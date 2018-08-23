//
//  Shape.swift
//  PaintApp
//
//  Created by Nurlybek Mussin on 14.02.18.
//  Copyright © 2018 Nurlybek Mussin. All rights reserved.
//

import Foundation
import UIKit

struct Shape{
   
    private var type = ""
    private var color = UIColor.black
    private var firstpoint: CGPoint?
    private var endpoint: CGPoint?
    private var isFilled: Bool?
    private var line_width: CGFloat = 1.0
    lazy var shapes: Dictionary <String, UIBezierPath> = [
        "circle": drawCircle(),
        "rectangle": drawRectangle(),
        "line": drawLine(),
        "triangle": drawTriangle(),
        "pen": drawLine()
    ]
    
    init(with initial_point: CGPoint, and end_point: CGPoint, _ isFilled: Bool) {
        firstpoint = initial_point
        endpoint = end_point
        self.isFilled = isFilled
    }
    
    func drawCircle() -> UIBezierPath{
        let x_center = CGFloat((Double((firstpoint?.x)!) + Double((endpoint?.x)!))/2)
        let y_center = CGFloat((Double((firstpoint?.y)!) + Double((endpoint?.y)!))/2)
        let center = CGPoint(x: x_center, y: y_center)
        let radius = CGFloat((pow((pow((endpoint?.x)! - (firstpoint?.x)!, 2) + pow((endpoint?.y)! - (firstpoint?.y)!, 2)),0.5))/2)
        let path = UIBezierPath(arcCenter: center, radius: radius, startAngle: 0.0, endAngle: CGFloat(Double.pi*2), clockwise: true)
        path.lineWidth = line_width
        color.set()
        return path
    }
    
    func drawRectangle() -> UIBezierPath{
        let rectSize = CGSize(width: (endpoint?.x)! - (firstpoint?.x)!, height: (endpoint?.y)! - (firstpoint?.y)!)
        let rectOrigin = CGPoint(x: (firstpoint?.x)!, y: (firstpoint?.y)!)
        let rect = CGRect(origin: rectOrigin, size: rectSize)
        let path = UIBezierPath(rect: rect)
        path.lineWidth = line_width
        color.set()
        color.setStroke()
        return path
    }
    
    func drawTriangle() -> UIBezierPath{
        let path = UIBezierPath()
        path.move(to: firstpoint!)
        path.addLine(to: endpoint!)
        path.addLine(to: CGPoint(x: (firstpoint?.x)!, y: (endpoint?.y)!))
        path.addLine(to: firstpoint!)
        path.lineWidth = line_width
        path.close()
        color.set()
        return path
    }
    
    func drawLine() -> UIBezierPath{
        let line = UIBezierPath()
        line.move(to: firstpoint!)
        line.addLine(to: endpoint!)
        line.lineWidth = line_width
        color.set()
        return line;
    }
    
    mutating func setColor(_ c: UIColor){
        color = c
    }
    
    mutating func setOperand(_ operand: String){
        type = operand
    }
    
    mutating func performShape(){
        if !isFilled! || type == "line"{
            shapes[type]?.stroke()
        }
        else {
            shapes[type]?.fill()
        }
    }
}

