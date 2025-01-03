//
//  HomeView.swift
//  mario-bros
//
//  Created by leonurium on 03/01/25.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var coordinator: Coordinator
    
    var body: some View {
        Text("Hello, Home!")
    }
}

#Preview {
    HomeView()
}
