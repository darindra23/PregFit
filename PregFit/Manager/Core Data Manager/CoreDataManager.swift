//
//  CoreDataManager.swift
//  PregFit
//
//  Created by Darindra R on 07/06/21.
//

import Foundation
import CoreData
import UIKit

class CoreDataManager {
    // MARK: - Config Core Data
    static var shared = CoreDataManager()
    private init() { }


    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "PregFit")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    lazy var context: NSManagedObjectContext = {
        return self.persistentContainer.viewContext
    }()

    // MARK: - Core Data Saving support
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}

// MARK: - Func for Business Processs
extension CoreDataManager {

}

// MARK: - Func for help this coredata manager only
fileprivate extension CoreDataManager {
    
}
