//
//  NewsVC.swift
//  SDUapp
//
//  Created by Nurlybek Mussin on 07.03.18.
//  Copyright © 2018 Nurlybek Mussin. All rights reserved.
//

import UIKit

class NewsVC: UITableViewController {
    let newsTitles = ["Become SDUdent!", "SDU Technopark", "SDU and MIT"]
    let newsDates = ["Dec. 27, 2017", "Dec. 26, 2017", "Nov. 26, 2017"]
    let newsImages = [UIImage(named: "news1"), UIImage(named: "news2"), UIImage(named: "news3")]
    let newsDescriptions = ["Knowledge is the key to your success, and SDU is the engine of success. Come, get knowledge and become successful! \nSometimes it happens that after entering a prestigious university, after a while you feel frustrated. In this case, SDU is always ready to provide support to all to become a qualified specialist. It's not too late to decide the main question and make the right choice!","The SDU Technopark received a new round of development and was transformed into an innovative cluster aimed at realizing the creative ideas and projects of our students. The administration of the university has made its wards a long-awaited surprise before the new year.", "The first educational pilot project in the field of information technology by the standards of the Massachusetts Institute of Technology (MIT) is launched in Almaty. The initiator of the project is Suleyman Demirel University.Within the framework of the pilot project, students from the largest prestigious American university will conduct training master classes and lectures for senior students of specialized schools, students of higher educational institutions of the Faculty of Engineering, as well as interested representatives of the business community specializing in IT industry."]
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
        return newsTitles.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customNewsCell", for: indexPath) as! NewsTableViewCell
        cell.newsTitle.text = newsTitles[indexPath.row]
        cell.newsDate.text = newsDates[indexPath.row]
        cell.newsImage.image = newsImages[indexPath.row]
        cell.newsDescription.text = newsDescriptions[indexPath.row]
        
        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showNewsDetailSegue"{
            let destination = segue.destination as! NewsDetailVC
            destination.news_title = newsTitles[(tableView.indexPathForSelectedRow?.row)!]
            destination.news_image = newsImages[(tableView.indexPathForSelectedRow?.row)!]!
            destination.news_description = newsDescriptions[(tableView.indexPathForSelectedRow?.row)!]
            destination.news_date = newsDates[(tableView.indexPathForSelectedRow?.row)!]
        }
    }

}
