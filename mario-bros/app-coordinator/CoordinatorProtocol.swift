//
//  CoordinatorProtocol.swift
//  mario-bros
//
//  Created by leonurium on 10/01/25.
//

import Foundation
import UIKit
import SwiftUI

protocol CoordinatorProtocol: ObservableObject {
    var navigationController: UINavigationController? { get set }
    
    func start() -> AnyView
    func eventOccured(event: CoordinatorEvent)
}
