import SwiftUI

struct PreviewingDataIntro: View {
    @FetchRequest(sortDescriptors: []) var friends: FetchedResults<FriendEntity>
    var body: some View {
        List(friends) { friend in
            Text(friend.firstName ?? "")
        }
        .font(.title)
    }
}

struct PreviewingData_Intro_Previews: PreviewProvider {
    static var previews: some View {
        PreviewingDataIntro()
            .environment(\.managedObjectContext, CoreDataManger.preview)
    }
}
