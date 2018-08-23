//
//  ViewController.swift
//  Animations
//
//  Created by Nurlybek Mussin on 02.04.18.
//  Copyright © 2018 Nurlybek Mussin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nextButtonOut: UIButton!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
    @IBAction func nextButton(_ sender: UIButton) {
        //fourthAnimation()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        nextButtonOut.layer.borderColor = UIColor.white.cgColor
        nextButtonOut.layer.borderWidth = 1
        nextButtonOut.layer.cornerRadius = 5
        username.layer.cornerRadius = 5
        password.layer.cornerRadius = 5
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nextButtonOut.alpha = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        username.center.x -= view.bounds.width
        password.center.x += view.bounds.width
        UIView.animate(withDuration: 0.75, delay: 0.0, options: [], animations: {
            self.username.center.x += self.view.bounds.width
            self.password.center.x -= self.view.bounds.width
            self.nextButtonOut.alpha = 1
        }, completion:nil)
    }
    
//    func secondAnimation(){
//        UIView.animateKeyframes(withDuration: 0.5, delay: 0.0, options: [], animations: {
//
//        }, completion:  nil)
//    }
//    func thirdAnimation(){
//        UIView.animateKeyframes(withDuration: 0.75, delay: 0.0, options: [], animations: {
//
//        }, completion: nil)
//    }
//
    func fourthAnimation(){
        UIView.animateKeyframes(withDuration: 0.6, delay: 0.0, options: [], animations: {
            self.username.center.x += self.view.bounds.width
            self.password.center.x -= self.view.bounds.width
            self.nextButtonOut.alpha = 0
        }, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

