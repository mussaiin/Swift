//
//  SocNetVC.swift
//  SDUapp
//
//  Created by Nurlybek Mussin on 06.03.18.
//  Copyright © 2018 Nurlybek Mussin. All rights reserved.
//

import UIKit

class SocNetVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let socnetTitles: [String] = ["Facebook"," Instagram", "VK"]
    let socnetSites: [String] = ["https://facebook.com/sdukz","https://instagram.com/sdukz","https://vk.com/sdukz"]
    let socnetIcons = [UIImage(named: "facebook"), UIImage(named: "instagram"), UIImage(named: "vk")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return socnetTitles.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "socnetCell", for: indexPath) as! SocNetTableViewCell
        cell.siteTitle.text = socnetTitles[indexPath.row]
        cell.siteIcon.image = socnetIcons[indexPath.row]
        return cell
    }
    /*
    // MARK: - Navigation
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "webSiteSegue"{
            if let destination = segue.destination as? SiteViewController{
                destination.website = socnetSites[(tableView.indexPathForSelectedRow?.row)!]
                destination.previousViewController = self
            }
        }
    }
}
