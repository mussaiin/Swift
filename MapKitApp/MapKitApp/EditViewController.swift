//
//  EditViewController.swift
//  MapKitApp
//
//  Created by Nurlybek Mussin on 28.03.18.
//  Copyright © 2018 Nurlybek Mussin. All rights reserved.
//
import CoreData
import UIKit

protocol PlaceDelegate{
    func reloadAnn()
    var places: [Places]{
        get set
    }
}
class EditViewController: UIViewController {
    var delegate: PlaceDelegate?
    var textTitle: String? = ""
    var textSubtitle: String? = ""
    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Places")
        do{
            let results = try context.fetch(request)
            if results.count > 0{
                for result in results as! [NSManagedObject]{
                    if let title = result.value(forKey: "title") as? String, let subtitle = result.value(forKey: "subtitle") as? String{
                        if title == textTitle && subtitle == textSubtitle {
                            result.setValue(titleText.text, forKey: "title")
                            result.setValue(subtitleText.text, forKey: "subtitle")
                            do{
                                try context.save()
                            }
                            catch{}
                        }
                        
                    }
                }
            }
        }
        catch{}
        delegate?.reloadAnn()
        navigationController?.popViewController(animated: true)
    }
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var subtitleText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
            titleText.text = textTitle
            subtitleText.text = textSubtitle
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
