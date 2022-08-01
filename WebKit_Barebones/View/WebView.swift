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
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    // 뷰 객체 생성, 초기 상태 구성. 딱 한 번만 호출됨.
    func makeUIView(context: Context) -> WKWebView {
        let view = WKWebView(frame: CGRect.zero)
        view.navigationDelegate = context.coordinator
        view.allowsBackForwardNavigationGestures = true
        view.scrollView.isScrollEnabled = true
        return view
    }
    
    // 지정된 뷰의 상태를 새 정보로 업데이트.
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(URLRequest(url: URL(string: webViewStateModel.pageURLString)!))
        
        if webViewStateModel.goToPage {
            uiView.load(URLRequest(url: URL(string: webViewStateModel.pageURLString)!))
            webViewStateModel.goToPage = false
        }
    }
    
    // 웹뷰 탐색의 진행 상황 추적
    class Coordinator: NSObject, WKNavigationDelegate {
        let parent: WebView
        init(_ parent: WebView) {
            self.parent = parent
        }
        
        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            if parent.webViewStateModel.goBack {
                webView.goBack()
                parent.webViewStateModel.goBack = false
            }
            if parent.webViewStateModel.goForward {
                webView.goForward()
                parent.webViewStateModel.goForward = false
            }
        }
    }
    
}
