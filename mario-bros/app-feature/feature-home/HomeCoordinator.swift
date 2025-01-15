//
//  HomeCoordinator.swift
//  mario-bros
//
//  Created by leonurium on 10/01/25.
//

import Foundation
import SwiftUI

public enum HomeCoordinator: CoordinatorRouter {
    case home(isAlreadyOnboarding: Bool)
    
    public var transition: CoordinatorRouterTransitionStyle {
        switch self {
        case .home(isAlreadyOnboarding: _):
            return .fullScreen
        }
    }
    
    @ViewBuilder
    public func view() -> some View {
        switch self {
        case .home(isAlreadyOnboarding: let isOnboarding):
            HomeView(isOnboarding: isOnboarding)
        }
    }
}
