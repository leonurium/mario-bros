//
//  AppCoordinator.swift
//  mario-bros
//
//  Created by leonurium on 10/01/25.
//

import Foundation
import SwiftUI
import UIKit

class AppCoordinator: CoordinatorProtocol, ObservableObject {
    var navigationController: UINavigationController?
    
    func start() -> AnyView {
//        let view = HomeView(coordinator: AppCoordinator())
//        return AnyView(view.environmentObject(self))
        
        let view = OnboardingView()
        return AnyView(view.environmentObject(self))
    }
    
    func eventOccured(event: CoordinatorEvent) {
        switch event {
        case .didClickBack:
            navigationController?.popViewController(animated: true)
        }
    }
}
