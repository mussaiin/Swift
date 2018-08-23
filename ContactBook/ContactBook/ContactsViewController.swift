//
//  ContactsViewController.swift
//  ContactBook
//
//  Created by Nurlybek Mussin on 06.02.18.
//  Copyright © 2018 Nurlybek Mussin. All rights reserved.
//

import UIKit
import CoreData

class ContactsViewController: UITableViewController {

    var contacts: [NSManagedObject] = []
    /*
        [name:"Nurlybek", phoneNumber: "870888150515"]
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        fetch()
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    func fetch(){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedObjectContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName:"Contact")
        //let req = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        do{
            //try managedObjectContext.execute(req)
            contacts = try managedObjectContext.fetch(fetchRequest) as! [NSManagedObject]
        } catch let error as NSError{
            print("Could not fetch. \(error)")
        }
    }
    
    func save(name: String, phoneNumber: String, gender: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedObjectContext = appDelegate.persistentContainer.viewContext
        guard let entity = NSEntityDescription.entity(forEntityName: "Contact", in: managedObjectContext) else { return }
        let contact = NSManagedObject(entity: entity, insertInto: managedObjectContext)
        contact.setValue(name, forKey: "name")
        contact.setValue(phoneNumber, forKey: "phoneNumber")
        contact.setValue(gender, forKey: "gender")
        do {
            try managedObjectContext.save()
            self.contacts.append(contact)
        } catch let error as NSError {
            print("Could not save. \(error)")
        }
    }
    func update(indexPath: IndexPath, name: String, phoneNumber: String, gender: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedObjectContext = appDelegate.persistentContainer.viewContext
        let contact = contacts[indexPath.row]
        contact.setValue(name, forKey: "name")
        contact.setValue(phoneNumber, forKey: "phoneNumber")
        contact.setValue(gender, forKey: "gender")
        do {
            try managedObjectContext.save()
            contacts[indexPath.row] = contact
        } catch let error as NSError {
            print("Could not save. \(error)")
        }
    }
    func delete(_ contact: NSManagedObject, at indexPath: IndexPath ) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedObjectContext = appDelegate.persistentContainer.viewContext
        managedObjectContext.delete(contact)
        contacts.remove(at: indexPath.row)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath) as! CustomCell
        
        let contact = contacts[indexPath.row]
        
        cell.NameLabel?.text =  contact.value(forKey:"name") as? String
        cell.PhoneLabel?.text =  contact.value(forKey:"phoneNumber") as? String
        cell.ImageLabel?.image = UIImage.init(named: (contact.value(forKey:"gender") as? String)!)
        
        cell.ImageLabel.layer.borderColor = UIColor.blue.cgColor
        cell.ImageLabel.layer.borderWidth = 2
        cell.ImageLabel.layer.cornerRadius = cell.ImageLabel.frame.size.height/2
        cell.ImageLabel.clipsToBounds = true
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            let contact = contacts[indexPath.row]
            delete(contact, at: indexPath)
            tableView.reloadData()
        }
    }
    //MARK: - Navigation
    
    @IBAction func unwindToContactList(segue: UIStoryboardSegue){
        if let viewController = segue.source as? AddContactViewController {
            guard let name: String = viewController.nameTextField.text, let phoneNumber: String = viewController.phoneTextField.text, let gender: String = viewController.genderTextField.text else { return }
            if name != "" && phoneNumber != "" {
                if let indexPath = viewController.indexPathForContact{
                    update(indexPath: indexPath, name: name, phoneNumber: phoneNumber, gender: gender)
                }
                else{
                    save(name: name, phoneNumber: phoneNumber, gender: gender)
                }
            }
            tableView.reloadData()
        } else if let viewController = segue.source as? ContactDetailViewController{
            if viewController.isDeleted {
                guard let indexPath: IndexPath = viewController.indexPath else { return }
                let contact = contacts[indexPath.row]
                delete(contact, at: indexPath)
                tableView.reloadData()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "contactDetailSegue"{
            guard let navViewController = segue.destination as? UINavigationController else { return }
            guard let viewController = navViewController.topViewController as? ContactDetailViewController else { return }
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            let contact = contacts[indexPath.row]
            viewController.contact = contact
            viewController.indexPath = indexPath
        }
    }
    

}
