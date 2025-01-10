//
//  Coordinator.swift
//  mario-bros
//
//  Created by leonurium on 03/01/25.
//

import SwiftUI

enum Page: String, Identifiable {
    case main
    
    var id: String {
        self.rawValue
    }
}

enum Sheet: String, Identifiable {
    case loginSheet
    
    var id: String {
        self.rawValue
    }
}

enum FullScreenCover: String, Identifiable {
    case onboarding
    case home
    
    var id: String {
        self.rawValue
    }
}

class Coordinator: ObservableObject {
    
    @Published var path = NavigationPath() // need ios 16
    @Published var sheet: Sheet?
    @Published var fullScreenCover: FullScreenCover?
    @Published var currentWebURL: URL? // Track current URL for SwiftWebView
    
    func push(page: Page) {
        path.append(page) // need ios 16
    }
    
    func present(sheet: Sheet) {
        self.sheet = sheet
    }
    
    func present(fullScreenCover: FullScreenCover) {
        self.fullScreenCover = fullScreenCover
    }
    
    func updateWebURL(_ url: URL?) {
        currentWebURL = url
        print("Updated Web URL: \(url?.absoluteString ?? "Unknown")")
    }
    
    func pop() {
        path.removeLast() // need ios 16
    }
    
    func popToRoot() {
        path.removeLast(path.count) // need ios 16
    }
    
    func dismissSheet() {
        sheet = nil
    }
    
    func dismissFullScreenCover() {
        fullScreenCover = nil
    }
    
    func exitWebView() {
        currentWebURL = nil
    }
    
    @ViewBuilder
    func build(page: Page) -> some View {
        switch page {
        case .main:
            ContentView()
        }
    }
    
    @ViewBuilder
    func build(sheet: Sheet) -> some View {
        switch sheet {
        case .loginSheet:
            LoginView()
        }
    }
    
    @ViewBuilder
    func build(fullScreenCover: FullScreenCover) -> some View {
        switch fullScreenCover {
        case .onboarding:
            OnboardingView()
        case .home:
            HomeView(coordinator: AppCoordinator())
        }
    }
}
