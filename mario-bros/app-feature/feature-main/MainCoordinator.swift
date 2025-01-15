//
//  MainCoordinator.swift
//  mario-bros
//
//  Created by leonurium on 15/01/25.
//

import Foundation
import SwiftUI

public enum MainCoordinator: CoordinatorRouter {
    case main
    case settings
    
    public var transition: CoordinatorRouterTransitionStyle {
        switch self {
        case .main:
            return .fullScreen
        case .settings:
            return .push
        }
    }
    
    @ViewBuilder
    public func view() -> some View {
        switch self {
        case .main:
            MainView()
        case .settings:
            SettingView()
        }
    }
}
