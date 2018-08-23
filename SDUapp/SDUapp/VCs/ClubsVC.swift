//
//  ClubsVC.swift
//  SDUapp
//
//  Created by Nurlybek Mussin on 06.03.18.
//  Copyright © 2018 Nurlybek Mussin. All rights reserved.
//

import UIKit

class ClubsVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let clubTitles: [String] = ["Academic club"," ART Club", "Debate club"]
    let clubSites: [String] = ["http://sdu.edu.kz/en/clubs/academic-club","http://sdu.edu.kz/en/clubs/art-club","http://sdu.edu.kz/en/clubs/debate-club"]
    let clubImages = [UIImage(named: "academicclub"), UIImage(named: "artclub"), UIImage(named: "debateclub")]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return clubTitles.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "clubCell", for: indexPath) as! ClubsTableViewCell
        cell.clubName.text = clubTitles[indexPath.row]
        cell.clubImage.image = clubImages[indexPath.row]
        return cell
    }
    /*
     // MARK: - Navigation
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowClubsDetail"{
            if let destination = segue.destination as? ClubSiteViewController{
                    destination.website = clubSites[(tableView.indexPathForSelectedRow?.row)!]
                    destination.previousViewController = self
            }
        }
    }
}
