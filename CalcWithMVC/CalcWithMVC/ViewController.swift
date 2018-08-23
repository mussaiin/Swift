//
//  ViewController.swift
//  CalcWithMVC
//
//  Created by Nurlybek Mussin on 22.01.18.
//  Copyright © 2018 Nurlybek Mussin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myDisplay: UILabel!
    
    var typing : Bool = false
    @IBAction func digitPressed(_ sender: UIButton) {
        if typing{
            let currentDisplay = myDisplay.text!
            let current_title_of_button = sender.currentTitle!
            myDisplay.text = currentDisplay+current_title_of_button
        }
        else{
            myDisplay.text = sender.currentTitle!
            typing = true
        }
    }
    var displayValue: Double{
        get{
            return Double(myDisplay.text!)!
        }
        set{
            myDisplay.text = String(newValue )
        }
    }
    private var mymodel =  CalculatorModel()
    
    @IBAction func operationPressed(_ sender: UIButton) {
        
        if typing{
            mymodel.setOperand(displayValue)
            typing = false
        }
        
        mymodel.performOperation(sender.currentTitle!)
        
        if let result = mymodel.result{
            displayValue = result
        }
        
    }
    @IBAction func operationClean(_ sender: UIButton) {
        myDisplay.text = "0"
        typing = false
    }
}

