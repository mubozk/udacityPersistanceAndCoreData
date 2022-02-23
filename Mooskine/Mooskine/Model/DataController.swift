//
//  DataController.swift
//  Mooskine
//
//  Created by Muhammet BOZKURT on 23.02.2022.
//  Copyright © 2022 Udacity. All rights reserved.
//

import Foundation
import CoreData //Import core d funcs

class DataController { // class instead of struct
                        // because it'll be relationshipped between viewcontrollers // no copies needed when its class
    let persistentContainer:NSPersistentContainer
    
    var viewContext:NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    init (modelName:String){
         persistentContainer = NSPersistentContainer(name: modelName )
    }
    
    func load(completion: (() -> Void)? = nil) {
        persistentContainer.loadPersistentStores { storeDescription, error in
            guard error == nil else {
                fatalError(error!.localizedDescription)
            }
            
            self.autoSaveViewContext()
            
            
            completion?()
        }
    }
}

extension DataController{
    func autoSaveViewContext(interval:TimeInterval = 30){
        
        print("autosaving")
        
        guard interval > 0 else {
            print("interval can't be negative")
            return
        }
        if viewContext.hasChanges{
            try? viewContext.save()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + interval) {
            self.autoSaveViewContext(interval: interval)
        }
    }
}
