//
//  SecondViewController.swift
//  TableViewSegue
//
//  Created by Darkhan on 29.01.18.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    var fruit_text = String()
    @IBOutlet weak var fruit_label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        fruit_label.text = fruit_text
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