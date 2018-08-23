//
//  WebSitesTableViewController.swift
//  WebBrowser04GH
//
//  Created by Darkhan on 30.01.18.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit

class WebsitesTableViewController: UITableViewController {
    
    
    @IBOutlet weak var SegmentedControl: UISegmentedControl!
    
    var siteTextField: UITextField?
    var urlTextField: UITextField?
    
    @IBAction func AddSite(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title:"Enter new website parameters", message:"Please, fill all the fields", preferredStyle: .alert)
        alertController.addTextField(configurationHandler: siteTextField)
        alertController.addTextField(configurationHandler: urlTextField)
        
        let okAction = UIAlertAction(title:"OK", style: .default, handler: self.addSiteHandler)
        alertController.addAction(okAction)
        self.present(alertController, animated: true)
        
    }
    
    func siteTextField(textField: UITextField) {
        siteTextField = textField
        siteTextField?.placeholder = "Enter the title"
    }
    
    func urlTextField(textField: UITextField) {
        urlTextField = textField
        urlTextField?.placeholder = "Enter the URL of site"
    }
    func addSiteHandler(alert: UIAlertAction) {
        if((siteTextField?.text!) != "" || (urlTextField?.text!) != ""){
            websites.append(Website.init((siteTextField?.text!)!, (urlTextField?.text!)!))
        }
        tableView.reloadData()
    }
    
    @IBAction func indexChanged(_ sender: Any) {asd
        
    }
    var websites: [Website] = [
        Website.init("Google", "https://google.com"),
        Website.init("Instagram", "https://instagram.com"),
        Website.init("VK", "https://vk.com"),
        Website.init("Facebook", "https://facebook.com"),
        Website.init("Yahoo", "https://yahoo.com")
        
    ]
    var favourites: [Website] = [
        Website.init("Google", "https://google.com")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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
        var returnValue=0
        
        switch SegmentedControl.selectedSegmentIndex {
            case 0:
                returnValue = websites.count
                break
            case 1:
                returnValue = favourites.count
                break
            default:
                break
        }
        
        return returnValue
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! CustomCell
        switch SegmentedControl.selectedSegmentIndex {
            case 0:
                cell.textLabel!.text = websites[indexPath.row].Name
                break
            case 1:
                cell.textLabel!.text = favourites[indexPath.row].Name
                break
            default:
                break
        }
        // Configure the cell...
        
        return cell
    }
    
    @IBAction func SegmentValueChanged(_ sender: Any) {
        tableView.reloadData()
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
        switch SegmentedControl.selectedSegmentIndex{
            case 0:
                websites.remove(at: indexPath.row)
                tableView.reloadData()
                break
            case 1:
                favourites.remove(at: indexPath.row)
                tableView.reloadData()
                break
            default:
                break
        }
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
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mySegue"{
            if let destination = segue.destination as? UINavigationController{
                if let dest = destination.visibleViewController as? SiteViewController{
                    switch SegmentedControl.selectedSegmentIndex {
                    case 0:
                        dest.webTitle = websites[(tableView.indexPathForSelectedRow?.row)!].Name
                        dest.website = websites[(tableView.indexPathForSelectedRow?.row)!].Url
                        dest.index = tableView.indexPathForSelectedRow?.row
                        dest.previousViewController = self
                        break
                    case 1:
                        dest.webTitle = favourites[(tableView.indexPathForSelectedRow?.row)!].Name
                        dest.website = favourites[(tableView.indexPathForSelectedRow?.row)!].Url
                        dest.index = tableView.indexPathForSelectedRow?.row
                        dest.previousViewController = self
                        break
                    default:
                        break
                    }
                }
            }
        }
        
    }    
}

