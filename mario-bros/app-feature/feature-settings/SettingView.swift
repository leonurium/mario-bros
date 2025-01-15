//
//  SettingView.swift
//  mario-bros
//
//  Created by leonurium on 15/01/25.
//

import SwiftUI

struct SettingView: View {
    @EnvironmentObject private var coordinator: Coordinator<MainCoordinator>
    var body: some View {
        Button("Back") {
            coordinator.pop()
        }
    }
}

#Preview {
    SettingView()
}
