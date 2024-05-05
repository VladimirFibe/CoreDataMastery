import SwiftUI

@main
struct CoreDataMasteryApp: App {
    var body: some Scene {
        WindowGroup {
            ParksView()
                .environment(\.managedObjectContext, CoreDataManger().persistentContainer.viewContext)
        }
    }
}
