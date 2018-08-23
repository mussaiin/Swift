//
//  SideMenuTableViewController.swift
//  SDUapp
//
//  Created by Nurlybek Mussin on 06.03.18.
//  Copyright © 2018 Nurlybek Mussin. All rights reserved.
//

import UIKit

class SideMenuTableViewController: UITableViewController {
    
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var facultyImage: UIImageView!
    @IBOutlet weak var clubsImage: UIImageView!
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var contactsImage: UIImageView!
    @IBOutlet weak var socNetImage: UIImageView!
    @IBOutlet weak var galleryImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(SideMenuTableViewController.swipedLeft))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(swipeLeft)
        
        logoImage.image = UIImage(named: "sdulogo")
        logoImage.layer.borderColor = UIColor.black.cgColor
        logoImage.layer.borderWidth = 2
        logoImage.layer.cornerRadius = logoImage.frame.size.height/2
        logoImage.clipsToBounds = true
        
        facultyImage.image = UIImage(named: "faculty")
        clubsImage.image = UIImage(named: "clubs")
        newsImage.image = UIImage(named: "news")
        contactsImage.image = UIImage(named: "phone")
        socNetImage.image = UIImage(named: "socnet")
        galleryImage.image = UIImage(named: "gallery")
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Add a background view to the table view
        let backgroundImage = UIImage(named: "")
        let imageView = UIImageView(image: backgroundImage)
        self.tableView.backgroundView = imageView
        imageView.contentMode = .scaleAspectFill
    }

    override func viewWillLayoutSubviews() {
        self.centerTableView()
    }
    
    @objc func swipedLeft() {
        NotificationCenter.default.post(name: NSNotification.Name("ToggleSideMenu"), object: nil)
    }
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor(white: 1, alpha: 0.0)
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        tableView.deselectRow(at: indexPath, animated: false)
        NotificationCenter.default.post(name: NSNotification.Name("ToggleSideMenu"), object: nil)
        switch indexPath.row {
        case 1: NotificationCenter.default.post(name: NSNotification.Name("ShowFaculties"), object: nil)
        case 2: NotificationCenter.default.post(name: NSNotification.Name("ShowClubs"), object: nil)
        case 3: NotificationCenter.default.post(name: NSNotification.Name("ShowNews"), object: nil)
        case 4: NotificationCenter.default.post(name: NSNotification.Name("ShowContacts"), object: nil)
        case 5: NotificationCenter.default.post(name: NSNotification.Name("ShowSocNet"), object: nil)
        case 6: NotificationCenter.default.post(name: NSNotification.Name("ShowGallery"), object: nil)
        default: break
        }
    }
}
extension UITableViewController {
    
    func centerTableView() {
        
        let contentSize = self.tableView.contentSize
        let boundsSize = self.tableView.bounds.size
        
        if contentSize.height < boundsSize.height {
            
            let yOffset = floor(boundsSize.height - contentSize.height) / 2
            
            tableView.contentOffset = CGPoint(x: 0, y: -yOffset)
        }
    }
}
