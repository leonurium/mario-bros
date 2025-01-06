//
//  HomeView.swift
//  mario-bros
//
//  Created by leonurium on 03/01/25.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var coordinator: Coordinator
    
    @State private var isLoading: Bool = false

    var body: some View {
        VStack {
            if isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
            }

            Text("Current URL: \(coordinator.currentWebURL?.absoluteString ?? "None")")
                .font(.footnote)
                .padding()

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
    HomeView()
}
