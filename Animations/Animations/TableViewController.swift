//
//  TableViewController.swift
//  Animations
//
//  Created by Nurlybek Mussin on 02.04.18.
//  Copyright © 2018 Nurlybek Mussin. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var rows = 0
    var models:[Model] = []
//    var models: [Model] = [Model.init("iPhone 7 Plus", "850$", "A10 Fusion", "12MPX"),
//                           Model.init("Samsung Galaxy S8", "500$", "Snapdragon 835", "12MPX"),
//                           Model.init("LG G4", "400$", "Snapdragon 808", "16MPX"),
//                           Model.init("iPhone 6s", "400$", "A7", "8MPX"),
//                           Model.init("iPhone X", "1000$", "A11 Fusion", "12MPX")]
//
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.reloadData()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        insertRowsMode3()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return models.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! TableViewCell
        
        cell.title.text = models[indexPath.row].Name
        cell.subtitle.text = models[indexPath.row].Price
        cell.viewTitle.text = models[indexPath.row].CoreDetail
        cell.viewSubtitle.text = models[indexPath.row].CamDetail
        cell.cellView.alpha = 0
 

        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.alpha = 0
        let transform = CATransform3DTranslate(CATransform3DIdentity, -350, 30, 0)
        cell.layer.transform = transform

        UIView.animate(withDuration: 1) {
            cell.alpha = 1
            cell.layer.transform = CATransform3DIdentity
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    // MARK: - third way to show table
    func insertRowsMode3() {
        insertRowMode3(ind: 0, m: Model.init("iPhone 7 Plus", "850$", "A10 Fusion", "12MPX")){
            self.insertRowMode3(ind: 1, m: Model.init("Samsung Galaxy S8", "500$", "Snapdragon 835", "12MPX"), comp: {
                self.insertRowMode3(ind: 2, m: Model.init("LG G4", "400$", "Snapdragon 808", "16MPX"), comp: {
                    self.insertRowMode3(ind: 3, m: Model.init("iPhone 6s", "400$", "A7", "8MPX"), comp: {
                        self.insertRowMode3(ind: 4, m: Model.init("iPhone X", "1000$", "A11 Fusion", "12MPX"), comp: {
                            print("all rows are inserted")
                        })
                    })
                })
            })
        }
    }
    
    func insertRowMode3(ind:Int, m: Model, comp:@escaping()->Void) {
        let indPath = IndexPath(row: ind, section: 0)
        models.append(m)
        tableView.insertRows(at: [indPath], with: UITableViewRowAnimation.left)
        
        DispatchQueue.main.asyncAfter(deadline: .now()+0.2) {
            comp()
        }
    }
    
}
