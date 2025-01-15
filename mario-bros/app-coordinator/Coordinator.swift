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
    @Published public var currentCoordinatorRouter: CoordinatingRouter?
    
    public init(navigationController: UINavigationController = .init(), startingCoordinatorRouter: CoordinatingRouter? = nil) {
        self.navigationController = navigationController
        self.currentCoordinatorRouter = startingCoordinatorRouter
    }
    
    public func start() {
        guard let router = currentCoordinatorRouter else { return }
        show(router)
    }
    
    public func switchCoordinator<NewCoordinatingRouter: CoordinatorRouter>(
            to newCoordinator: Coordinator<NewCoordinatingRouter>,
            startingRoute: NewCoordinatingRouter
    ) {
        // Remove existing view controllers to clean up the navigation stack
        navigationController.viewControllers = []
        newCoordinator.currentCoordinatorRouter = startingRoute
        newCoordinator.start()
    }
    
    public func show(_ coordinatorRouter: CoordinatingRouter, animated: Bool = true) -> some View {
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
        let coordinatorView = CoordinatorView(navigationController: self.navigationController)
        return coordinatorView
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
