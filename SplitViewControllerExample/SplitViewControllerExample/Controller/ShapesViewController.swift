//
//  ShapesViewController.swift
//  SplitViewControllerExample
//
//  Created by Darkhan on 12.02.18.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit

class ShapesViewController: UIViewController {
    private var shapes: [String: Drawable] = [
        "rect": Rectangle.init(UIColor.black, false),
        "circle": Circle.init(UIColor.black, false),
        "filledRect": Rectangle.init(UIColor.black, true),
        "filledCircle": Circle.init(UIColor.black, true),
        "redFilledCircle": Circle.init(UIColor.red, true)
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let destination = segue.destination as? DrawingAreaViewController{
//            if let identifier = segue.identifier{
//                destination.current_shape = shapes[identifier]
//            }
//        }
        if let destination = segue.destination as? UINavigationController{
            if let contentViewController = destination.visibleViewController as? DrawingAreaViewController{
                contentViewController.current_shape = shapes[segue.identifier!]
            }
        }
    }
    
    
}
