//
//  MainView.swift
//  mario-bros
//
//  Created by leonurium on 15/01/25.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject private var coordinator: Coordinator<MainCoordinator>
    
    var body: some View {
        TabView {
            HomeView(isOnboarding: false)
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
                .environmentObject(coordinator)
        }
    }
}

#Preview {
    MainView()
}
