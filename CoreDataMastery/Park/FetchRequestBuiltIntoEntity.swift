import SwiftUI

struct FetchRequestBuiltIntoEntity: View {
    @Environment(\.managedObjectContext) var moc
    @State private var parksCount = 0
    @State private var parks: [String] = []
    var body: some View {
        NavigationStack {
            List {
                VStack {
                    Text("Parks")
                        .bold()
                        .badge(parksCount)
                        .font(.title2)
                    Text(parks, format: .list(type: .and, width: .standard))
//                        .fixedSize(horizontal: false, vertical: true)
                }
            }
            .task {
                let request = ParkEntity.fetchRequest()
                request.predicate = NSPredicate(format: "country_ CONTAINS %@", "States")
                request.sortDescriptors = [NSSortDescriptor(key: "name_", ascending: true)]
                if let parks = try? moc.fetch(request) {
                    parksCount = parks.count
                    parks.forEach {
                        self.parks.append($0.name)
                    }
                }
//                if let count = try? moc.count(for: request) {
//                    parksCount = count
//                }
            }
            .navigationTitle("Details")
        }
    }
}

#Preview {
    FetchRequestBuiltIntoEntity()
}
