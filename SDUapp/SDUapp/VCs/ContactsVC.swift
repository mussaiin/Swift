//
//  ContactsVC.swift
//  SDUapp
//
//  Created by Nurlybek Mussin on 06.03.18.
//  Copyright © 2018 Nurlybek Mussin. All rights reserved.
//

import UIKit
import MapKit

class ContactsVC: UIViewController {
    let contacts_text: String = "Abylai-Khan street 1/1 \nAlmaty, Karasay \nKaskelen city, 040900, Kazakhstan \nTel.: +7 727 307 95 60/65 (220, 231, 455) \nMob.: + 7 702 000 11 33 (whatsapp) \nFax: +7 727 307 95 58 \ne-mail: info@sdu.edu.kz​​"
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var contactsText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let distanceSpan: CLLocationDegrees = 1000
        let sduLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(43.208245, 76.669427)
        mapView.setRegion(MKCoordinateRegionMakeWithDistance(sduLocation, distanceSpan, distanceSpan), animated: true)
        
        let mapPin = MapPinAnnotation(title: "Suleyman Demirel University", subtitle: "Abylai-Khan, 1/1", coordinate: sduLocation)
        mapView.addAnnotation(mapPin)
        contactsText.text = contacts_text
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
