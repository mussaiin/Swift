//
//  MainViewController.swift
//  SDUapp
//
//  Created by Nurlybek Mussin on 06.03.18.
//  Copyright © 2018 Nurlybek Mussin. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var welcomeTitle: UILabel!
    @IBOutlet weak var mainPageImage: UIImageView!
    @IBOutlet weak var titleSubtitle: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeTitle.text = "Welcome to SDUapp!"
        titleSubtitle.text = "Süleyman Demirel University (abbreviated as SDU) is a private university in Kaskelen, Almaty, Kazakhstan. It is named after Süleyman Demirel, the former prime minister and president of Turkey. \nThe university was established in 1996, by the initiatives of the president of Kazakhstan, Nursultan Nazarbayev, and the former president of Turkey, Suleyman Demirel."
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(showFaculties),
                                               name: NSNotification.Name("ShowFaculties"),
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(showClubs),
                                               name: NSNotification.Name("ShowClubs"),
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(showNews),
                                               name: NSNotification.Name("ShowNews"),
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(showContacts),
                                               name: NSNotification.Name("ShowContacts"),
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(showSocNet),
                                               name: NSNotification.Name("ShowSocNet"),
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(showGallery),
                                               name: NSNotification.Name("ShowGallery"),
                                               object: nil)
        
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(MainViewController.swipedLeft))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(MainViewController.swipedRight))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRight)
        
        mainPageImage.image = UIImage(named: "SDU3")

    }
    
    @objc func swipedLeft() {
        NotificationCenter.default.post(name: NSNotification.Name("ToggleSideMenu"), object: nil)
    }
    @objc func swipedRight() {
        NotificationCenter.default.post(name: NSNotification.Name("ToggleSideMenu"), object: nil)
    }
    @objc func showFaculties(){
        performSegue(withIdentifier: "ShowFaculties", sender: nil)
    }
    @objc func showClubs(){
        performSegue(withIdentifier: "ShowClubs", sender: nil)
    }
    @objc func showNews(){
        performSegue(withIdentifier: "ShowNews", sender: nil)
    }
    @objc func showContacts(){
        performSegue(withIdentifier: "ShowContacts", sender: nil)
    }
    @objc func showSocNet(){
        performSegue(withIdentifier: "ShowSocNet", sender: nil)
    }
    @objc func showGallery(){
        performSegue(withIdentifier: "ShowGallery", sender: nil)
    }
    
    @IBAction func onMenuButtonTapped() {
        print("toggle side menu")
        NotificationCenter.default.post(name: NSNotification.Name("ToggleSideMenu"), object: nil)
    }
    
}
