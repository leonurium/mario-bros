//
//  LoginView.swift
//  mario-bros
//
//  Created by leonurium on 03/01/25.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject private var coordinator: Coordinator
    @StateObject private var viewModel = LoginViewModel()

    var body: some View {
        VStack(spacing: 20) {
            TextField("Email or Phone Number", text: $viewModel.emailOrPhone)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.emailAddress) // Change to .phonePad if phone number

            SecureField("Password", text: $viewModel.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button(action: viewModel.login) {
                Text("Login")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .disabled(viewModel.emailOrPhone.isEmpty || viewModel.password.isEmpty || viewModel.isLoading)

            if viewModel.showError {
                Text(viewModel.errorMessage)
                    .foregroundColor(.red)
                    .padding(.top, 10)
            }
        }
        .padding()
        .alert(isPresented: $viewModel.showError) {
            Alert(title: Text("Error"), message: Text(viewModel.errorMessage), dismissButton: .default(Text("OK")))
        }
    }
}

#Preview {
    LoginView()
}
