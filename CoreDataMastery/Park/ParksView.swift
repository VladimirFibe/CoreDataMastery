import SwiftUI

struct ParksView: View {
    @FetchRequest<ParkEntity>(sortDescriptors: [], animation: .easeOut(duration: 2)) private var parks
    @Environment(\.managedObjectContext) var moc
    @State private var justCanada = false
    @State private var searchText = ""
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    ForEach(parks) { park in
                        HStack(alignment: .top) {
                            Image(uiImage: park.image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 60, height: 60)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                            VStack(alignment: .leading, spacing: 4) {
                                Text(park.name)
                                    .font(.title)
                                Text(park.location)
                                    .fontWeight(.light)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            Image(systemName: park.viewRating)
                        }
                    }
                }
                Button("Add") {
                    let park = ParkEntity(context: moc)
                    park.name = "Jasper"
                    park.country = "Canada"
                    park.region = "Alberta"
                    park.image = .jasper
                    park.rating = 5
                    try? moc.save()
                }
            }
            .navigationTitle("Parks")
            .toolbar {
                ToolbarItem {
                    Button {
                        justCanada.toggle()
                        parks.nsPredicate = justCanada ? NSPredicate(format: "country_ = 'Canada'") : nil
                    } label: {
                        Image(systemName: justCanada ? "globe" : "globe.americas.fill")
                    }
                }
            }
            .searchable(text: $searchText)
            .onChange(of: searchText) { oldValue, newValue in
                parks.nsPredicate = newValue.isEmpty ? nil : NSPredicate(format: "name_ CONTAINS %@", newValue)
            }
        }
    }
}

#Preview {
    ParksView()
}
