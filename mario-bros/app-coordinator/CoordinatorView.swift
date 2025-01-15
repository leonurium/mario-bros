//
//  CoordinatorView.swift
//  mario-bros
//
//  Created by leonurium on 13/01/25.
//

import Foundation
import SwiftUI

struct CoordinatorView: UIViewControllerRepresentable {
    var navigationController: UINavigationController
    
    func makeUIViewController(context: Context) -> UINavigationController {
        return navigationController
    }
    
    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
        
    }
}
