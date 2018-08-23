//
//  MyTableViewController.swift
//  TableViewSegue
//
//  Created by Darkhan on 29.01.18.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit

class MyTableViewController: UITableViewController {
    var fruits : [Fruit] = [
        Fruit.init(UIImage.init(named: "eden")!,"Apple"),
        Fruit.init(UIImage.init(named: "eden")!,"Pineapple"),
        Fruit.init(UIImage.init(named: "eden")!,"Orange"),
        Fruit.init(UIImage.init(named: "eden")!,"Banana")
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

   
   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return fruits.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! CustomCell

        cell.fruit_imageView.image = fruits[indexPath.row].Fruit_image
        cell.fruit_label.text = fruits[indexPath.row].Fruit_name
        return cell
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            fruits.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }

 
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "mySegue"{
            let destination = segue.destination as! SecondViewController
            destination.fruit_text = fruits[(tableView.indexPathForSelectedRow?.row)!].Fruit_name!
        }
        
    }
 

}
