//
//  AppView.swift
//  mario-bros
//
//  Created by leonurium on 10/01/25.
//

import SwiftUI

struct AppView: View, CoordinatingProtocol {
    var coordinator: (any CoordinatorProtocol)?
    
    var body: some View {
        Text("")
            .onAppear {
                coordinator?.start()
            }
    }
}

#Preview {
    AppView()
}
