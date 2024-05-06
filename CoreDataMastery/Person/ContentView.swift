struct Person {
    let name: String
    let age: Int
}

import SwiftUI

struct ContentView: View {
    
    @State private var name = ""
    @State private var age = 0
    var body: some View {
        VStack {
            TextField("Name", text: $name)
            TextField("Age", value: $age, format: .number)
            
            Button("Save") {
                let newPerson = Person(name: name, age: age)
                print(newPerson)
            }
        }
        .textFieldStyle(.roundedBorder)
        .font(.title)
        .padding()
    }
}

#Preview {
    ContentView()
}
