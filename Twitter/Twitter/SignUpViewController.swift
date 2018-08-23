//
//  SignUpViewController.swift
//  Twitter
//
//  Created by Nurlybek Mussin on 11.04.18.
//  Copyright © 2018 Nurlybek Mussin. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SignUpViewController: UIViewController {

    var dbRef: DatabaseReference?
    
    @IBOutlet weak var fullname: UITextField!
    
    @IBOutlet weak var dateOfBirth: UITextField!
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        indicator.alpha = 0
        backButton.alpha = 0
        // Do any additional setup after loading the view.
    }

    @IBAction func backPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "signUpSegue", sender: self)
    }
    @IBOutlet weak var signUpPressed: UIButton!
    @IBAction func signUpPressed(_ sender: UIButton) {
        indicator.alpha = 1
        indicator.startAnimating()
        
        Auth.auth().createUser(withEmail: email.text!, password: password.text!, completion: { (user, error) in
            self.indicator.stopAnimating()
            if (error == nil){
                user?.sendEmailVerification(completion: { (error) in
                    if error == nil{
                        self.messageLabel.text = "Check your email. We sent you a verification link"
                        self.messageLabel.textColor = UIColor.green
                        self.dbRef = Database.database().reference()
                        self.dbRef = self.dbRef?.child("users")
                        let users = Users.init(self.fullname.text!, self.email.text!, self.dateOfBirth.text!, self.password.text!)
                        self.dbRef?.childByAutoId().setValue(users.toJSONFormat())
                        self.backButton.alpha = 1
                    }
                })
                
                //self.performSegue(withIdentifier: "signInSegue", sender: self)
            }else{
                self.messageLabel.text = "Something is wrong!"
                self.messageLabel.textColor = UIColor.red
            }
        })
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
