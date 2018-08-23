//
//  ViewController.swift
//  MapKitApp
//
//  Created by Nurlybek Mussin on 27.03.18.
//  Copyright © 2018 Nurlybek Mussin. All rights reserved.
//
import CoreData
import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, UITableViewDelegate, UITableViewDataSource, PlaceDelegate{
    
//    var pins: [PinLocation] = [
//                PinLocation.init("SDU", "University", CLLocationCoordinate2DMake(43.208245, 76.669427)),
//                PinLocation.init("Hello", "Bye", CLLocationCoordinate2DMake(43.216891, 76.824852)),
//                PinLocation.init("Market", "SDU", CLLocationCoordinate2DMake(43.245139, 76.957382))
//            ]
    
    var places: [Places] = []
    var pinTitle: String?
    var pinSubtitle: String?
    var pinCoordinate: CLLocationCoordinate2D?
    
    var titleTextField: UITextField?
    var subtitleTextField: UITextField?
    var indexOfPin = 0;
    
    //SIDE ANN BUTTONS
    
    @IBAction func rightButton(_ sender: UIButton) {
        indexOfPin+=1
        if(indexOfPin >= places.count){
            indexOfPin = 0
        }
        self.mapView.setRegion(MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2DMake(places[indexOfPin].lat, places[indexOfPin].lon), 1500, 1500), animated: true)
        navigationItem.title = places[indexOfPin].title
    }
    @IBAction func leftButton(_ sender: UIButton) {
        indexOfPin-=1
        if(indexOfPin <= 0){
            indexOfPin = places.count-1
        }
        self.mapView.setRegion(MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2DMake(places[indexOfPin].lat, places[indexOfPin].lon), 1500, 1500), animated: true)
        navigationItem.title = places[indexOfPin].title
    }
    var tableAppear = false
    
    //ORGANIZE BAR
    
    @IBAction func barButtonPressed(_ sender: UIBarButtonItem) {
        if tableAppear{
            tableView.alpha = 0
            tableAppear = false
        }
        else{
            tableView.alpha = 1
            tableAppear = true
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var segmentedController: UISegmentedControl!
    
    //SEGMENTED CONTROL MAP TYPE
    
    @IBAction func selectedSegmentControl(_ sender: UISegmentedControl!) {
            switch (sender.selectedSegmentIndex) {
                case 0:
                    mapView.mapType = .standard
                case 1:
                    mapView.mapType = .satellite
                case 2:
                    mapView.mapType = .hybrid
                default:
                    mapView.mapType = .standard
            }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.alpha = 0
        mapView.delegate = self
//        mapView.delegate = self
//        for pin in pins {
//            mapView.addAnnotation(pin)
//        }

        places = CoreDataHandler.fetchObject()!
        for pin in places{
            let ann = MKPointAnnotation()
            ann.coordinate = CLLocationCoordinate2D(latitude: pin.lat, longitude: pin.lon)
            ann.title = pin.title!
            ann.subtitle = pin.subtitle!
            mapView.addAnnotation(ann)
        }
//        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(_ animated: Bool) {
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = view.bounds
        tableView.backgroundView = blurView
    }

    //MAP VIEW
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let pin = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "pin")
        pin.canShowCallout = true
        pin.animatesDrop = true
        pin.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        return pin
    }
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let annView = view.annotation
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let editView = storyBoard.instantiateViewController(withIdentifier: "editer") as! EditViewController
        editView.textTitle = (annView?.title)!
        editView.textSubtitle = (annView?.subtitle)!
        editView.delegate = self
        self.navigationController?.pushViewController(editView, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addPin(_ sender: UILongPressGestureRecognizer) {
        let location = sender.location(in: mapView)
        let locCord = self.mapView.convert(location, toCoordinateFrom: self.mapView)
        
        //1. Create the alert controller.
        let alert = UIAlertController(title: "Title", message: "Enter a text", preferredStyle: .alert)
        
        //2. Add the text field. You can configure it however you need.
        alert.addTextField { (titleTextField) in
            titleTextField.placeholder = "Add title"
        }
        alert.addTextField { (subtitleTextField) in
            subtitleTextField.placeholder = "Add subtitle"
        }
        // 3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let titleTextField = alert?.textFields![0].text
            let subtitleTextField = alert?.textFields![1].text// Force unwrapping because we know it exists.
            CoreDataHandler.saveObject(titleTextField!, subtitleTextField!, locCord.longitude, locCord.latitude)
            
            
            self.places = CoreDataHandler.fetchObject()!
            let pin = MKPointAnnotation()
            pin.coordinate = locCord
            pin.title = titleTextField
            pin.subtitle = subtitleTextField
//            mapPin.coordinate = locCord
//            mapPin.title = titleTextField
//            mapPin.subtitle  = subtitleTextField
//
            
            self.tableView.reloadData()
            self.mapView.addAnnotation(pin)
            self.mapView.setRegion(MKCoordinateRegionMakeWithDistance(locCord, 1500, 1500), animated: true)
        }))
        
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)

    }
    
    
    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        tableAppear = false
        tableView.alpha = 0
        mapView.setRegion(MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2DMake(places[indexOfPin].lat, places[indexOfPin].lon), 1500, 1500), animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return places.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
//        let place = places[indexPath.row]
//        cell.textLabel?.text = place.value(forKey:"title") as? String
//        cell.detailTextLabel?.text = place.value(forKey:"subtitle") as? String
        
        cell.textLabel?.text = places[indexPath.row].title
        cell.detailTextLabel?.text = places[indexPath.row].subtitle
        
        cell.textLabel?.textColor = UIColor.black
        cell.detailTextLabel?.textColor = UIColor.black
        
        tableView.backgroundColor = UIColor.clear
        cell.backgroundColor = .clear
        tableView.tableFooterView = UIView()
        
        return cell
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    // Override to support editing the table view.
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            reloadAnnotations(indexPath.row)
            tableView.reloadData()
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    func reloadAnnotations(_ index: Int){
        CoreDataHandler.deleteObject(ann: places[index])
        places = CoreDataHandler.fetchObject()!
        let delann = mapView.annotations
        mapView.removeAnnotations(delann)
        for pin in places{
            let ann = MKPointAnnotation()
            ann.coordinate = CLLocationCoordinate2D(latitude: pin.lat, longitude: pin.lon)
            ann.title = pin.title!
            ann.subtitle = pin.subtitle!
            mapView.addAnnotation(ann)
        }
        tableView.reloadData()
    }
    func reloadAnn(){
        places = CoreDataHandler.fetchObject()!
        let delann = mapView.annotations
        mapView.removeAnnotations(delann)
        for pin in places{
            let ann = MKPointAnnotation()
            ann.coordinate = CLLocationCoordinate2D(latitude: pin.lat, longitude: pin.lon)
            ann.title = pin.title!
            ann.subtitle = pin.subtitle!
            mapView.addAnnotation(ann)
        }
        tableView.reloadData()
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

