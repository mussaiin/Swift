//
//  ContactDetailViewController.swift
//  ContactBook
//
//  Created by Nurlybek Mussin on 06.02.18.
//  Copyright © 2018 Nurlybek Mussin. All rights reserved.
//

import UIKit
import CoreData

class ContactDetailViewController: UIViewController {
    
    var contact: NSManagedObject? = nil
    var indexPath: IndexPath? = nil
    var isDeleted: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = contact?.value(forKey: "name") as? String
        phoneLabel.text = contact?.value(forKey: "phoneNumber") as? String
        genderImage.image = UIImage.init(named: contact?.value(forKey: "gender") as! String)
        genderImage.layer.borderColor = UIColor.blue.cgColor
        genderImage.layer.borderWidth = 2
        genderImage.layer.cornerRadius = genderImage.frame.size.height/2
        genderImage.clipsToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBOutlet weak var nameLabel: UILabel!    
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var genderImage: UIImageView!
    
    @IBAction func done(_ sender: Any) {
        performSegue(withIdentifier: "unwindToContactList", sender: self)
    }
    
    @IBAction func deleteContact(_ sender: Any) {
        isDeleted = true
        performSegue(withIdentifier: "unwindToContactList", sender: self)
    }
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editContactSegue"{
            guard let viewController = segue.destination as? AddContactViewController else { return }
            viewController.titleText = "Edit Contact"
            viewController.contact = contact
            viewController.indexPathForContact = self.indexPath!
        }
    }

}
