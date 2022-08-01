//
//  WebView.swift
//  WebKit_Barebones
//
//  Created by 이로운 on 2022/08/01.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    @ObservedObject var webViewStateModel: WebViewStateModel
    
    func makeUIView(context: Context) -> WKWebView {
        let view = WKWebView(frame: CGRect.zero)
        view.allowsBackForwardNavigationGestures = true
        view.scrollView.isScrollEnabled = true
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(URLRequest(url: URL(string: webViewStateModel.pageURLString)!))
        
        if webViewStateModel.goToPage {
            uiView.load(URLRequest(url: URL(string: webViewStateModel.pageURLString)!))
            webViewStateModel.goToPage = false 
        }
    }
    
}
