//
//  ViewController.swift
//  PaintApp
//
//  Created by Nurlybek Mussin on 13.02.18.
//  Copyright © 2018 Nurlybek Mussin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var initial_point: CGPoint?
    var end_point: CGPoint?
    var number: String?
    
    @IBAction func colorSelect(_ sender: UIButton) {
        drawArea.currentColor = sender.backgroundColor!
    }
    
    @IBAction func longUndo(_ sender: UILongPressGestureRecognizer) {
        if !drawArea.shapes.isEmpty{
            drawArea.shapes.removeAll()
            drawArea.setNeedsDisplay()
        }
    }
    
    @IBAction func Switch(_ sender: UISwitch) {
        drawArea.isOn = sender.isOn
    }
    
    @IBAction func shapeSelect(_ sender: UIButton) {
        drawArea.setType(sender.currentTitle!)
        
    }
    
    @IBAction func undoPressed(_ sender: UIButton) {
        if !drawArea.shapes.isEmpty{
            drawArea.shapes.removeLast()
            drawArea.setNeedsDisplay()
        }
    }
    
    @IBOutlet weak var drawArea: CustomView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawArea.clipsToBounds = true
        drawArea.isMultipleTouchEnabled = false
        drawArea.viewController = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

