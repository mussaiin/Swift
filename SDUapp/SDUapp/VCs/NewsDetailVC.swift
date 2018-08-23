//
//  NewsDetailVC.swift
//  SDUapp
//
//  Created by Nurlybek Mussin on 07.03.18.
//  Copyright © 2018 Nurlybek Mussin. All rights reserved.
//

import UIKit

class NewsDetailVC: UIViewController {

    var news_title = String()
    var news_description = String()
    var news_date = String()
    var news_image = UIImage()
    
    @IBOutlet weak var newsDetailImage: UIImageView!
    @IBOutlet weak var newsDetailTitle: UILabel!
    @IBOutlet weak var newsDetailDate: UILabel!
    @IBOutlet weak var newsDetailDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newsDetailTitle.text = news_title
        newsDetailImage.image = news_image
        newsDetailDescription.text = news_description
        newsDetailDate.text = news_date
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
