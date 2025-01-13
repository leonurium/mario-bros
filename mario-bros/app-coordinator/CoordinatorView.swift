//
//  CoordinatorView.swift
//  mario-bros
//
//  Created by leonurium on 13/01/25.
//

import Foundation
import SwiftUI

struct CoordinatorView: UIViewControllerRepresentable {
    @ObservedObject var coordinator: Coordinator<OnboardingCoordinator>
    
    func makeUIViewController(context: Context) -> UINavigationController {
        DispatchQueue.main.async {
            coordinator.start()
        }
        return coordinator.navigationController
    }
    
    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
        
    }
}
