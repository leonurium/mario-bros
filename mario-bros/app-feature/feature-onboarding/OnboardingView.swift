//
//  OnboardingView.swift
//  mario-bros
//
//  Created by leonurium on 03/01/25.
//

import SwiftUI

struct OnboardingView: View {
    
    @EnvironmentObject private var coordinator: Coordinator<OnboardingCoordinator>
    @StateObject private var homeCoordinator = Coordinator<HomeCoordinator>(startingCoordinatorRouter: .home(isAlreadyOnboarding: true))
    
    var body: some View {
        TabView {
            Text("Hello From Me!")
                .tag(0)
            Text("Hello From I!")
                .tag(1)
            Text("Hello John Doe!")
                .tag(2)
            Button("Done") {
                homeCoordinator.start()
            }
                .tag(3)
        }
        .tabViewStyle(PageTabViewStyle())
        .environmentObject(coordinator)
    }
}

#Preview {
    OnboardingView()
}
