//
//  mario_brosApp.swift
//  mario-bros
//
//  Created by leonurium on 03/01/25.
//

import SwiftUI

@main
struct mario_brosApp: App {
    @StateObject private var coordinator = Coordinator<OnboardingCoordinator>(startingCoordinatorRouter: .onboarding)
        
    var body: some Scene {
        WindowGroup {
            coordinator.show(.onboarding)
        }
    }
}
