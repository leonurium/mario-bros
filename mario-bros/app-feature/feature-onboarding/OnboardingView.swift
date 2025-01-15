//
//  OnboardingView.swift
//  mario-bros
//
//  Created by leonurium on 03/01/25.
//

import SwiftUI

struct OnboardingView: View {
    
    @EnvironmentObject private var coordinator: Coordinator<OnboardingCoordinator>
    
    var body: some View {
        TabView {
            Text("Hello From Me!")
                .tag(0)
            Text("Hello From I!")
                .tag(1)
            Text("Hello John Doe!")
                .tag(2)
            Button("Done") {
                coordinator.dismiss(animated: true) {
                    coordinator.show(.home)
                }
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
