//
//  FacultyVC.swift
//  SDUapp
//
//  Created by Nurlybek Mussin on 06.03.18.
//  Copyright © 2018 Nurlybek Mussin. All rights reserved.
//

import UIKit

class FacultyVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let facultyNames = ["Faculty of Law and Social Sciences", "Faculty of Education and Humanities", "Faculty of Engineering and Natural Sciences", "Faculty of Economics and Business"]
    let facultyImages = [UIImage(named: "law"), UIImage(named: "philology"), UIImage(named: "engineering"), UIImage(named: "econom")]
    let facultyColors = [UIColor.init(red: 255/255.0, green: 55/255.0, blue: 70/255.0, alpha: 0.9),
                         UIColor.init(red: 0/255.0, green: 225/255.0, blue: 105/255.0, alpha: 0.9),
                         UIColor.init(red: 0/255.0, green: 100/255.0, blue: 255/255.0, alpha: 0.9),
                         UIColor.init(red: 255/255.0, green: 230/255.0, blue: 0/255.0, alpha: 0.9)]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return facultyNames.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! FacultyCollectionViewCell
        
        cell.facultyName.text = facultyNames[indexPath.row]
        cell.facultyImage.image = facultyImages[indexPath.row]
        cell.backgroundColor = facultyColors[indexPath.row]
        cell.contentView.layer.cornerRadius = 4.0
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = false
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        cell.layer.shadowRadius = 4.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
        
        return cell
    }
}
