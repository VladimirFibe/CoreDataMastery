import SwiftUI

struct PeopleView: View {
    @FetchRequest(sortDescriptors: []) private var people: FetchedResults<PersonEntity>
    @Environment(\.managedObjectContext) var moc
    var body: some View {
        VStack {
            List(people) { person in
                Text(person.name ?? "")
            }
            Button("Add Person") {
                let person = PersonEntity(context: moc)
                person.name = ["Mark", "Lem", "Chase"].randomElement()
                try? moc.save()
            }
        }
        .font(.title)
    }
}

#Preview {
    PeopleView()
}
