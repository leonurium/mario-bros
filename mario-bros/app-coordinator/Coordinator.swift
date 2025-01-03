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
    case splashScreen
    case onboarding
    
    var id: String {
        self.rawValue
    }
}

class Coordinator: ObservableObject {
    
    @Published var path = NavigationPath() // need ios 16
    @Published var sheet: Sheet?
    @Published var fullScreenCover: FullScreenCover?
    
    func push(page: Page) {
        path.append(page)
    }
    
    func present(sheet: Sheet) {
        self.sheet = sheet
    }
    
    func present(fullScreenCover: FullScreenCover) {
        self.fullScreenCover = fullScreenCover
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func dismissSheet() {
        sheet = nil
    }
    
    func dismissFullScreenCover() {
        fullScreenCover = nil
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
            ContentView()
        }
    }
    
    @ViewBuilder
    func build(fullScreenCover: FullScreenCover) -> some View {
        switch fullScreenCover {
        case .splashScreen:
            ContentView()
        }
    }
}
