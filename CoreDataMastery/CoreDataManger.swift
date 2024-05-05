import CoreData

class CoreDataManger {
    let persistentContainer: NSPersistentContainer
    
    init(forPreview: Bool = false) {
        persistentContainer = NSPersistentContainer(name: "MasteryData")
        if forPreview {
            persistentContainer.persistentStoreDescriptions.first!.url = URL(filePath: "/dev/null")
        }
        persistentContainer.loadPersistentStores { store, _ in
            print(store.url?.absoluteString ?? "")
        }
        if forPreview {
            CoreDataManger.addMockData(moc: persistentContainer.viewContext)
        }
    }
    
    static var preview: NSManagedObjectContext {
        let persistentContainer = NSPersistentContainer(name: "MateryData")
        persistentContainer.persistentStoreDescriptions.first!.url = URL(filePath: "/dev/null")
        persistentContainer.loadPersistentStores { _, _ in }
        addMockData(moc: persistentContainer.viewContext)
        return persistentContainer.viewContext
    }
}

extension CoreDataManger {
    static func addMockData(moc: NSManagedObjectContext) {
        let friend1 = FriendEntity(context: moc)
        friend1.firstName = "Chris"
        friend1.lastName = "Bloom"
        
        let friend2 = FriendEntity(context: moc)
        friend2.firstName = "Jaqueline"
        friend2.lastName = "Cruz"
        
        let friend3 = FriendEntity(context: moc)
        friend3.firstName = "Rodrigo"
        friend3.lastName = "Jones"
        
        try? moc.save()
    }
}
