import SwiftUI

@main
struct CoreDataMasteryApp: App {
    var body: some Scene {
        WindowGroup {
            MOCDelete()
                .environment(\.managedObjectContext, CoreDataManger().persistentContainer.viewContext)
        }
    }
}
