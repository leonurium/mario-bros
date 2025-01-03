//
//  LoginView.swift
//  mario-bros
//
//  Created by leonurium on 03/01/25.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject private var coordinator: Coordinator
    
    var body: some View {
        Text("Hello, Login!")
    }
}

#Preview {
    LoginView()
}
