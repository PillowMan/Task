//
//  DataManager.swift
//  TestClient
//
//  Created by Дмитрий Григорьев on 10.03.2021.
//  Copyright © 2021 SplitApp. All rights reserved.
//

import Foundation
import CoreData


protocol DataManagerProtocol: class {
    var persistentContainer: NSPersistentContainer {get}
    func fetchCallList() -> [CallData]?
    func deleteAllData(from entity: String)
    func saveContext ()
    
}



//MARK: CoreData manager
class DataManager: DataManagerProtocol{
    
    public static var shared: DataManagerProtocol = DataManager()
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "TestClient")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    
    // MARK: - Core Data Saving support
    
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        } else {
            print("has no changes")
        }
    }
    
    func fetchCallList() -> [CallData]? {
        let fetchRequest: NSFetchRequest<CallData> = CallData.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "created", ascending: true)]
        do {
            let results = try persistentContainer.viewContext.fetch(fetchRequest)
            return results
        } catch let error as NSError {
            print(error)
        }
        return nil
    }
    
    func deleteAllData(from entity: String) {
        do {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
            let results = try persistentContainer.viewContext.fetch(fetchRequest)
            results.forEach { (object) in
                guard let object = object as? NSManagedObject else {return}
                persistentContainer.viewContext.delete(object)
            }
        } catch let error as NSError {
            print(error)
        }
    }
    
    
    
    
}
