//
//  ViewController.swift
//  Twitter
//
//  Created by Nurlybek Mussin on 10.04.18.
//  Copyright © 2018 Nurlybek Mussin. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController {
    
    @IBOutlet weak var email_field: UITextField!
    
    @IBOutlet weak var password_field: UITextField!
    
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        indicator.alpha = 0
        password_field.isSecureTextEntry = true        
    }
    
    @IBAction func signUpPressed(_ sender: UIButton) {
    }
    
    @IBAction func signinPressed(_ sender: UIButton) {
        indicator.alpha = 1
        indicator.startAnimating()
        Auth.auth().signIn(withEmail: email_field.text!, password: password_field.text!, completion: { (user, error) in
            self.indicator.stopAnimating()
            if error == nil{
                if (user?.isEmailVerified)!{
                    self.performSegue(withIdentifier: "signInSegue", sender: self)
                }else{
                    self.messageLabel.textColor = UIColor.red
                    self.messageLabel.text = "Your email is not verified!"
                }
            }else{
                self.messageLabel.text = "Error! User is not signed up."
            }
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

