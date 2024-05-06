import SwiftUI

struct EditTaskView: View {
    let task: TaskEntity?
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    @State private var taskName = ""
    @State private var priority = 1
    @State private var dueDate = Date()
    @State private var done = false
    
    var body: some View {
        VStack(spacing: 16.0) {
            TextField("task", text: $taskName)
                .textFieldStyle(.roundedBorder)
            VStack(alignment: .leading) {
                Text("Priority")
                Picker(selection: $priority) {
                    Text("1").tag(1)
                    Text("2").tag(2)
                    Text("3").tag(3)
                } label: {
                    Text("Priority")
                }
            }
            DatePicker("Due Date", selection: $dueDate)
            Button(done ? "Start" : "Finish") {
                done.toggle()
            }
            Button("Save") {
                task?.taskName = taskName
                task?.priority = Int16(priority)
                task?.dueDate = dueDate
                task?.done = done
                try? moc.save()
                dismiss()
            }
            .padding()
            .onAppear {
                taskName = task?.viewTaskName ?? ""
                priority = Int(task?.priority ?? 1)
                dueDate = task?.dueDate ?? Date()
                done = task?.done ?? false
            }
        }
    }
}
