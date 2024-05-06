import SwiftUI

struct SFRIntro: View {
    @SectionedFetchRequest<String?, ParkEntity>(
        sectionIdentifier: \.country_,
        sortDescriptors: [.init(\.country_)])
    private var parks
    @State var isExpanded = true
    var body: some View {
        NavigationStack {
            List(parks) { section in
                Section(isExpanded: $isExpanded) {
                    ForEach(section) { park in
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
                } header: {
                    Text(section.id ?? "?")
                }
            }
            .headerProminence(.increased)
            .listStyle(.sidebar)
            .navigationTitle("Parks")
            .toolbar {
                ToolbarItem {
                    Button {
                        parks.sectionIdentifier = \.region_
                        parks.sortDescriptors = [.init(\.region_)]
                    } label: {
                         Image(systemName: "globe")
                    }
                }
            }
        }
    }
}

#Preview {
    SFRIntro()
}
