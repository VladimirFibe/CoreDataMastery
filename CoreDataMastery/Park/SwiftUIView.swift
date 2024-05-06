//
//  SwiftUIView.swift
//  CoreDataMastery
//
//  Created by MacService on 06.05.2024.
//

import SwiftUI

struct SwiftUIView: View {
    @State var isExpanded = true
    
    var body: some View {
        List {
            Section {
                Text("one")
                Text("two")
                Text("three")
            } header: {
                Text("Section Title")
            }
        }
        .listStyle(.sidebar)
    }
}

#Preview {
    SwiftUIView()
}

