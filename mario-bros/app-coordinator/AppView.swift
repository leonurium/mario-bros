//
//  AppView.swift
//  mario-bros
//
//  Created by leonurium on 10/01/25.
//

import SwiftUI

struct AppView: View, CoordinatingProtocol {
    @EnvironmentObject var coordinator: AppCoordinator
    
    var body: some View {
        NavigationView {
            coordinator.start()
        }
    }
}

#Preview {
    AppView()
}
