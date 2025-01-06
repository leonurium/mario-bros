//
//  CoordinatorView.swift
//  mario-bros
//
//  Created by leonurium on 03/01/25.
//

import SwiftUI

struct CoordinatorView: View {
    @StateObject private var coordinator = Coordinator()
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            /// initial view
            coordinator.build(fullScreenCover: .onboarding)
//            coordinator.build(sheet: .loginSheet)
            
                /// for navihation push and pop
                .navigationDestination(for: Page.self) { page in
                    coordinator.build(page: page)
                }
            
                /// for navigation sheet from bottom, able to scroll to dismiss
                .sheet(item: $coordinator.sheet) { sheet in
                    coordinator.build(sheet: sheet)
                }
            
                /// for navigation sheet from bottom but full screen
                .fullScreenCover(item: $coordinator.fullScreenCover) { fullScreenCover in
                    coordinator.build(fullScreenCover: fullScreenCover)
                }
        }
        .environmentObject(coordinator)
    }
}

#Preview {
    CoordinatorView()
}
