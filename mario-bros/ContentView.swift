//
//  ContentView.swift
//  mario-bros
//
//  Created by leonurium on 03/01/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var coordinator: Coordinator
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
//                .foregroundStyle(.tint) //need ios 15
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
