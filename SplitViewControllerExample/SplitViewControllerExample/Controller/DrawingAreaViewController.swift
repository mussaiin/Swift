//
//  DrawingAreaViewController.swift
//  SplitViewControllerExample
//
//  Created by Darkhan on 12.02.18.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit

class DrawingAreaViewController: UIViewController {

    @IBOutlet weak var customView: CustomView!
    var current_shape: Drawable?
    override func viewDidLoad() {
        super.viewDidLoad()
        if current_shape != nil{
            customView.current_shape = current_shape!
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
