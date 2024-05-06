import SwiftUI

struct MOCDelete: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest<TaskEntity>(sortDescriptors: [.init(\.priority)]) private var tasks
    @State private var newTask = false
    var body: some View {
        NavigationStack {
            List {
                ForEach(tasks) { task in
                    NavigationLink {
                        EditTaskView(task: task)
                    } label: {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(task.viewTaskName)
                                    .strikethrough(task.done, color: .red)
                                Text(task.viewDueDate)
                                    .font(.caption)
                            }
                            Spacer()
                            Image(systemName: task.viewPriority)
                                .foregroundStyle(task.color)
                        }
                        .font(.title2)
                    }

                }
                .onDelete(perform: deleteTask)
            }
            .toolbar {
                ToolbarItem {
                    Button {
                        newTask.toggle()
                    } label:  {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $newTask) {
              InsertTaskView()
            }
        }
    }
    
    private func deleteTask(offsets: IndexSet) {
        for offset in offsets {
            moc.delete(tasks[offset])
        }
        try? moc.save()
    }
}

#Preview {
    MOCDelete()
}
