//
//  CoreDataEntityManager.swift
//  movie-land
//
//  Created by Dogukan Yolcuoglu on 26.02.2024.
//

import UIKit
import CoreData
import Signals

final class CoreDataEntityManager: NSObject {
    
    static let shared = CoreDataEntityManager()
    var managedContext: NSManagedObjectContext!
    var entity: NSManagedObject!
    var isSavedSucces = Signal<Bool>()
    var reloadPageSubject = Signal<Bool>()
    
    private override init() { }
    
    func configureEntity(_ entityName: String) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        managedContext = appDelegate.persistentContainer.viewContext
        entity = NSEntityDescription.insertNewObject(forEntityName: entityName, into: managedContext)
    }
    
    func saveContextToEntity() {
        do {
            try managedContext.save()
            self.isSavedSucces.fire(true)
            print("Success context")
        } catch {
            self.isSavedSucces.fire(false)
            print("Error save context")
        }
    }
}
