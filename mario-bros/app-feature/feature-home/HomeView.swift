//
//  HomeView.swift
//  mario-bros
//
//  Created by leonurium on 03/01/25.
//

import SwiftUI

struct HomeView: View, CoordinatingProtocol {
    var coordinator: AppCoordinator
    
    @State private var isLoading: Bool = false

    var body: some View {
        VStack {
            if isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
            }

            SwiftWebView(
                urlString: "https://dev-games-app.rctiplus.com/",
                isLoading: $isLoading,
                coordinator: coordinator,
                messageHandler: { (userContent, message) in
                    print(message)
                }
            )
            .edgesIgnoringSafeArea(.all)
        }
    }
}

#Preview {
    HomeView(coordinator: AppCoordinator())
}
