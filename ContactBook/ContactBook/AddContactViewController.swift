//
//  AddContactViewController.swift
//  ContactBook
//
//  Created by Nurlybek Mussin on 06.02.18.
//  Copyright © 2018 Nurlybek Mussin. All rights reserved.
//

import UIKit
import CoreData

class AddContactViewController: UIViewController {
    
    let gender = ["Male", "Female"]
    var pickedGender: String = "Male"
    
    func createGenderPicker() {
        let genderPicker = UIPickerView()
        genderPicker.delegate = self
        genderTextField.inputView = genderPicker
    }
    
    var titleText = "Add Contact"
    var contact: NSManagedObject? = nil
    var indexPathForContact: IndexPath? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createGenderPicker()
        titleLabel.text = titleText
        
        nameTextField.layer.cornerRadius = 10
        nameTextField.layer.borderWidth = 1
        nameTextField.clipsToBounds = true
        nameTextField.layer.borderColor = UIColor.darkGray.cgColor
        
        phoneTextField.layer.cornerRadius = 10
        phoneTextField.layer.borderWidth = 1
        phoneTextField.clipsToBounds = true
        phoneTextField.layer.borderColor = UIColor.darkGray.cgColor
        
        genderTextField.layer.cornerRadius = 10
        genderTextField.layer.borderWidth = 1
        genderTextField.clipsToBounds = true
        genderTextField.layer.borderColor = UIColor.darkGray.cgColor
        
        CancelButton.layer.cornerRadius = 10
        CancelButton.layer.borderWidth = 1
        CancelButton.clipsToBounds = true
        CancelButton.layer.borderColor = UIColor.darkGray.cgColor
        
        SaveButton.layer.cornerRadius = 10
        SaveButton.layer.borderWidth = 1
        SaveButton.clipsToBounds = true
        SaveButton.layer.borderColor = UIColor.darkGray.cgColor
        
        if let contact = self.contact{
                nameTextField.text = contact.value(forKey: "name") as? String
                phoneTextField.text = contact.value(forKey: "phoneNumber") as? String
                genderTextField.text = contact.value(forKey: "gender") as? String
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBOutlet weak var SaveButton: UIButton!
    @IBOutlet weak var CancelButton: UIButton!
    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet weak var genderTextField: UITextField!
    // MARK: - Navigation
    
    @IBAction func saveAndClose(_ sender: Any) {
        performSegue(withIdentifier: "unwindToContactList", sender: self)
    }
    
    @IBAction func closeWithoutSave(_ sender: Any) {
        nameTextField.text = nil
        phoneTextField.text = nil
        genderTextField.text = nil
        performSegue(withIdentifier: "unwindToContactList", sender: self)
    }
    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension AddContactViewController: UIPickerViewDataSource, UIPickerViewDelegate{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return gender.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return gender[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickedGender = gender[row]
        genderTextField.text = pickedGender
    }
    
}
