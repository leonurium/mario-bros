//
//  ProfileView.swift
//  mario-bros
//
//  Created by leonurium on 15/01/25.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject private var coordinator: Coordinator<MainCoordinator>
    
    var body: some View {
        Button("This Profile, Go To Settings") {
            coordinator.dismiss(animated: true, completion: {
                coordinator.show(.settings)
            })
        }
    }
}

#Preview {
    ProfileView()
}
