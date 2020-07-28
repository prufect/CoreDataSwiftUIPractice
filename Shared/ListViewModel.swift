//
//  ListViewModel.swift
//  CoreDataPractice
//
//  Created by Prudhvi Gadiraju on 7/28/20.
//

import SwiftUI
import CoreData

class ListViewModel: ObservableObject {
    let context = persistentContainer.viewContext

    @Published var data: [NSManagedObject] = []
    @Published var text: String = ""
    
    @Published var isUpdating: Bool = false
    @Published var updateText: String = ""
    @Published var selectedObj: NSManagedObject = NSManagedObject()

    init() {
        readData()
    }
    
    func readData() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Data")
        
        do {
            data = try context.fetch(request) as! [NSManagedObject]
        } catch {
            print("Error fetching core data: \(error), \(error.localizedDescription)")
        }
    }
    
    func writeData() {
        let entity = NSEntityDescription.insertNewObject(forEntityName: "Data", into: context)
        entity.setValue(text, forKey: "name")
        
        do {
            try context.save()
            data.append(entity)
            text = ""
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func deleteData(indexSet: IndexSet) {
        for index in indexSet {
            do {
                let obj = data[index]
                context.delete(obj)
                try context.save()
                
                if let index = data.firstIndex(of: obj) {
                    data.remove(at: index)
                }
                
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
    
    func updateData() {
        if let index = data.firstIndex(of: selectedObj) {
            do {
                let obj = data[index]
                obj.setValue(updateText, forKey: "name")
                try context.save()
                
                data[index] = obj
                
                isUpdating.toggle()
                updateText = ""
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
    
    func getValue(for object: NSManagedObject) -> String {
        return object.value(forKey: "name") as! String
    }
    
    func openUpdateView(obj: NSManagedObject) {
        selectedObj = obj
        isUpdating.toggle()
    }
}
