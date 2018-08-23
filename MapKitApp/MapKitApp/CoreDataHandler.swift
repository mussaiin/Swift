//
//  CoreDataHandler.swift
//  MapKitApp
//
//  Created by Nurlybek Mussin on 28.03.18.
//  Copyright © 2018 Nurlybek Mussin. All rights reserved.
//

import UIKit
import CoreData
import MapKit

class CoreDataHandler: NSObject  {
    private class func getContext()->NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    class func saveObject(_ title:String,_ subtitle:String,_ lon:Double,_ lat:Double) {
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "Places", in: context)
        let managedObject = NSManagedObject(entity: entity!, insertInto: context)
        managedObject.setValue(title, forKey: "title")
        managedObject.setValue(subtitle, forKey: "subtitle")
        managedObject.setValue(lon, forKey: "lon")
        managedObject.setValue(lat, forKey: "lat")
        
        do{
            try context.save()
        }
        catch{}
    }
    class func fetchObject()->[Places]?{
        let context = getContext()
        var annotation:[Places]? = nil
        do{
            annotation = try context.fetch(Places.fetchRequest())
            return annotation
        }
        catch{
            return annotation
        }
    }
    class func deleteObject(ann: Places){
        let context = getContext()
        context.delete(ann)
        do{
            try context.save()
        }
        catch{
        }
    }
    
    
}
