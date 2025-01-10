//
//  mario_brosApp.swift
//  mario-bros
//
//  Created by leonurium on 03/01/25.
//

import SwiftUI

@main
struct mario_brosApp: App {
    @StateObject private var coordinator = AppCoordinator()
    
    var body: some Scene {
        WindowGroup {
            AppView()
                .environmentObject(coordinator)
        }
    }
}
