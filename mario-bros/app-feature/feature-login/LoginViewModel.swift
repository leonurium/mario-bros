//
//  LoginViewModel.swift
//  mario-bros
//
//  Created by leonurium on 06/01/25.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
    @Published var emailOrPhone: String = ""
    @Published var password: String = ""
    @Published var isLoading: Bool = false
    @Published var showError: Bool = false
    @Published var errorMessage: String = ""

    private var cancellables: Set<AnyCancellable> = []

    func login() {
        showError = false
        isLoading = true

        // Simulate network request
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            if self.emailOrPhone == "test@example.com" && self.password == "password123" {
                self.isLoading = false
            } else {
                self.isLoading = false
                self.showError = true
                self.errorMessage = "Invalid email/phone number or password"
            }
        }
    }
}
