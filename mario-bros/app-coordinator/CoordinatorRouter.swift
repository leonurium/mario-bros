//
//  CoordinatorRouter.swift
//  mario-bros
//
//  Created by leonurium on 13/01/25.
//

import Foundation
import SwiftUI

public protocol CoordinatorRouter {
    
    associatedtype V: View

    var transition: CoordinatorRouterTransitionStyle { get }
    
    /// Creates and returns a view of assosiated type
    ///
    @ViewBuilder
    func view() -> V
}
