//
//  Coordinator.swift
//  mario-bros
//
//  Created by leonurium on 13/01/25.
//

import Foundation
import SwiftUI

open class Coordinator<CoordinatingRouter: CoordinatorRouter>: ObservableObject {
    
    public let navigationController: UINavigationController
    public let startingCoordinatorRouter: CoordinatingRouter?
    
    public init(navigationController: UINavigationController = .init(), startingCoordinatorRouter: CoordinatingRouter? = nil) {
        self.navigationController = navigationController
        self.startingCoordinatorRouter = startingCoordinatorRouter
    }
    
    public func start() {
        guard let route = startingCoordinatorRouter else { return }
        show(route)
    }
    
    public func show(_ coordinatorRouter: CoordinatingRouter, animated: Bool = true) {
        let view = coordinatorRouter.view()
        let viewWithCoordinator = view.environmentObject(self)
        let viewController = UIHostingController(rootView: viewWithCoordinator)
        switch coordinatorRouter.transition {
        case .push:
            navigationController.pushViewController(viewController, animated: animated)
        case .formSheet:
            viewController.modalPresentationStyle = .formSheet
            navigationController.present(viewController, animated: animated)
        case .fullScreen:
            viewController.modalPresentationStyle = .fullScreen
            navigationController.present(viewController, animated: animated)
        }
    }
    
    public func pop(animated: Bool = true) {
        navigationController.popViewController(animated: animated)
    }
    
    public func popToRoot(animated: Bool = true) {
        navigationController.popToRootViewController(animated: animated)
    }
    
    open func dismiss(animated: Bool = true, completion: (() -> Void)? = nil) {
        navigationController.dismiss(animated: true) { [weak self] in
            /// because there is a leak in UIHostingControllers that prevents from deallocation
            self?.navigationController.viewControllers = []
            completion?()
        }
    }
}
