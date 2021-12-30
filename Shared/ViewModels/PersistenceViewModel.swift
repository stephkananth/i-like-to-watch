//
//  PersistenceViewModel.swift
//  ILikeToWatch
//
//  Created by Steph Ananth on 12/29/21.
//

import CoreData
import Foundation

class PersistenceViewModel: ObservableObject {
    @Published var items: [WatchItem] = []
    
    static let shared: PersistenceViewModel = PersistenceViewModel()
    
    // MARK: Create
    func saveItem(item: WatchItem) {
        let context: NSManagedObjectContext = PersistenceController.shared.container.viewContext
        guard let entity: NSEntityDescription = NSEntityDescription.entity(forEntityName: "Item", in: context) else { return }
        let newItem = NSManagedObject(entity: entity, insertInto: context)
        newItem.setValue(item.getImdbID, forKey: "imdbID")
        newItem.setValue(item.getGenres as [NSString], forKey: "genres")
        newItem.setValue(item.getMediaTypeID, forKey: "mediaTypeID")
        newItem.setValue(item.getPlatformID, forKey: "platformID")
        newItem.setValue(item.getPosterData, forKey: "posterData")
        newItem.setValue(item.getRatingID, forKey: "ratingID")
        newItem.setValue(item.getReleaseDate, forKey: "releaseDate")
        newItem.setValue(item.getRuntime, forKey: "runtime")
        newItem.setValue(item.getTitle, forKey: "title")
        newItem.setValue(item.getWatchDate, forKey: "watchDate")
        newItem.setValue(item.getYearEnd, forKey: "yearEnd")
        newItem.setValue(item.getYearStart, forKey: "yearStart")
        do {
            try context.save()
        } catch {
            print("ERROR: Failed to save item to watch history with title: \(item.getTitle)")
        }
    }
    
    // MARK: Read
    func updateItems() {
        items.removeAll()
        fetchItems()
        items.sort { $0.watchDate > $1.watchDate }
    }
    
    func fetchItems() {
        let context: NSManagedObjectContext = PersistenceController.shared.container.viewContext
        let request: NSFetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Item")
        request.returnsObjectsAsFaults = false
        guard let result: [NSFetchRequestResult] = try? context.fetch(request) else { return }
        guard let managedObjects: [NSManagedObject] = result as? [NSManagedObject] else { return }
        for managedObject in managedObjects {
            loadItem(from: managedObject)
        }
    }

    func loadItem(from data: NSManagedObject) {
        let newItem = WatchItem()
        newItem.imdbID = data.value(forKey: "imdbID") as! String
        newItem.genres = data.value(forKey: "genres") as? [String] ?? []
        newItem.posterData = data.value(forKey: "posterData") as? Data
        newItem.platform = Platform(intValue: data.value(forKey: "platformID") as! Int)!
        newItem.rating = Rating(intValue: data.value(forKey: "ratingID") as! Int)!
        newItem.releaseDate = data.value(forKey: "releaseDate") as? Date
        newItem.runtime = data.value(forKey: "runtime") as? Int
        newItem.title = data.value(forKey: "title") as! String
        newItem.type = MediaType(intValue: data.value(forKey: "mediaTypeID") as! Int)!
        newItem.watchDate = data.value(forKey: "watchDate") as! Date
        newItem.yearStart = data.value(forKey: "yearStart") as? Int
        newItem.yearEnd = data.value(forKey: "yearEnd") as? Int
        items.append(newItem)
    }
    
    // MARK: Delete
    func deleteItem(at offsets: IndexSet) {
        let context: NSManagedObjectContext = PersistenceController.shared.container.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Item")
        request.returnsObjectsAsFaults = false
        for index in offsets {
            let item: WatchItem = items[index]
            do {
                let result: [NSFetchRequestResult] = try context.fetch(request)
                guard let managedObjects: [NSManagedObject] = result as? [NSManagedObject] else { return }
                for managedObject in managedObjects {
                    if item.getImdbID == (managedObject.value(forKey: "imdbID") as? String) &&
                        item.getTitle == (managedObject.value(forKey: "title") as? String) &&
                        item.getWatchDate == (managedObject.value(forKey: "watchDate") as? Date) {
                        context.delete(managedObject)
                        try context.save()
                    }
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        items.remove(atOffsets: offsets)
    }
}
