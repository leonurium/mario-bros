//
//  HomeView.swift
//  mario-bros
//
//  Created by leonurium on 03/01/25.
//

import SwiftUI

struct HomeView: View {
    @State private var isLoading: Bool = false
    @State var isOnboarding: Bool

    var body: some View {
        VStack {
            if isOnboarding {
                Text("IsOnboarding")
            }
            if isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
            }

            SwiftWebView(
                urlString: "https://dev-games-app.rctiplus.com/",
                isLoading: $isLoading,
                messageHandler: { (userContent, message) in
                    print(message)
                }
            )
            .edgesIgnoringSafeArea(.all)
        }
    }
}

#Preview {
    HomeView(isOnboarding: false)
}
