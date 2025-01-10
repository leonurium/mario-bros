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
    
    func start() -> any View {
        var view: some View & CoordinatingProtocol = HomeView()
        return view
    }
    
    func eventOccured(event: CoordinatorEvent) {
        
    }
}
