//
//  SwiftWebView.swift
//  mario-bros
//
//  Created by leonurium on 03/01/25.
//

import SwiftUI
import WebKit

// register user Content Controller context webview here
enum SwiftWebViewUserContentControllerName: String, CaseIterable {
    case iosCallbackHandlers
    
}
// register ObserveValue name here
enum SwiftWebViewObserveValueName: String, CaseIterable {
    case estimatedProgress
}

struct SwiftWebView: UIViewRepresentable {
    let urlString: String
    @Binding var isLoading: Bool
    let messageHandler: ((SwiftWebViewUserContentControllerName, String) -> Void)?
    
    internal class WebViewCoordinator: NSObject, WKNavigationDelegate, WKScriptMessageHandler {
        var parent: SwiftWebView
        
        init(parent: SwiftWebView) {
            self.parent = parent
        }
        
        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            parent.isLoading = true
//            parent.coordinator.updateWebURL(webView.url)
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            parent.isLoading = false
//            parent.coordinator.updateWebURL(webView.url)
        }
        
        func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
            parent.isLoading = false
            print(error.localizedDescription)
        }
        
        func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
            if let userContentControllerName = SwiftWebViewUserContentControllerName(rawValue: message.name),
               let body = message.body as? String {
                parent.messageHandler?(userContentControllerName, body)
                print("JavaScript Message: \(body)")
                
                switch userContentControllerName {
                case .iosCallbackHandlers:
                    break
                default:
                    break
                }
            }
        }
    }
    
    func makeCoordinator() -> WebViewCoordinator {
        WebViewCoordinator(parent: self)
    }
    
    func makeUIView(context: Context) -> WKWebView {
        let configuration = WKWebViewConfiguration()
        configuration.defaultWebpagePreferences.allowsContentJavaScript = true
        let contentController = configuration.userContentController
        
        let userContents = SwiftWebViewUserContentControllerName.allCases
        for userContent in userContents {
            contentController.add(context.coordinator, name: userContent.rawValue)
        }
        
        let webView = WKWebView(frame: .zero, configuration: configuration)
        webView.navigationDelegate = context.coordinator
        if let url = URL(string: urlString) {
            print("load web view")
            webView.load(URLRequest(url: url))
        }
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    }
    
    func evaluate(stringScript: String) {
        
    }
    
    static func dismantleUIView(_ uiView: WKWebView, coordinator: WebViewCoordinator) {
        uiView.navigationDelegate = nil
        let userContents = SwiftWebViewUserContentControllerName.allCases
        for userContent in userContents {
            uiView.configuration.userContentController.removeScriptMessageHandler(forName: userContent.rawValue)
        }
    }
}

