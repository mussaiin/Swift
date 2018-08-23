//
//  LoadSiteViewController.swift
//  WebBrowser04GH
//
//  Created by Darkhan on 30.01.18.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit

class LoadSiteViewController: UIViewController, UIWebViewDelegate {
    var website : String?
    var index: Int?
    @IBOutlet weak var webView: UIWebView!
    var previousViewController : WebsitesTableViewController?
    @IBOutlet weak var second_background: UIView!
    @IBOutlet weak var myIndicator: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        myIndicator.startAnimating()
        if let nonOptionalWebsite = website{
            let site_url = URL(string: nonOptionalWebsite)
            webView.loadRequest(URLRequest(url: site_url!))
        }
        
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
    func webViewDidFinishLoad(_ webView: UIWebView) {
        second_background.layer.opacity = 0
        myIndicator.stopAnimating()
        navigationController?.popViewController(animated: true)
    }
}

