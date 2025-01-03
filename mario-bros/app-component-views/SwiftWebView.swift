//
//  SwiftWebView.swift
//  mario-bros
//
//  Created by leonurium on 03/01/25.
//

import SwiftUI
import WebKit

struct SwiftWebView: UIViewRepresentable {
    let urlString: String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            uiView.load(request)
        }
    }
}


