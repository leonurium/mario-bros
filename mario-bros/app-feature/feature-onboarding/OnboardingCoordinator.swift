//
//  OnboardingCoordinator.swift
//  mario-bros
//
//  Created by leonurium on 10/01/25.
//

import Foundation
import SwiftUI


public enum OnboardingCoordinator: CoordinatorRouter {
    case home
    case login
    case onboarding
    
    public var transition: CoordinatorRouterTransitionStyle {
        switch self {
        case .onboarding:
            return .fullScreen
        case .home:
            return .push
        case .login:
            return .push
        }
    }
    
    @ViewBuilder
    public func view() -> some View {
        switch self {
        case .onboarding:
            OnboardingView()
        case .home:
            HomeView()
        case .login:
            LoginView()
        }
    }
}
