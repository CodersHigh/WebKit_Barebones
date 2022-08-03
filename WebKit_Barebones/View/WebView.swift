//
//  WebView.swift
//  WebKit_Barebones
//
//  Created by 이로운 on 2022/08/01.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    @ObservedObject var viewModel: WebViewStateModel
    
    // 뷰 객체 생성, 초기 상태 구성. 딱 한 번만 호출됨.
    func makeUIView(context: Context) -> WKWebView {
        let view = WKWebView()
        return view
    }
    
    // 지정된 뷰의 상태를 새 정보로 업데이트.
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
        // 검색 버튼을 눌렀을 때, 해당 url로 이동
        if viewModel.goToPage {
            uiView.load(URLRequest(url: URL(string: viewModel.pageURLString)!))
            viewModel.goToPage = false
        }
        
        // 뒤로 가기
        if viewModel.goBack {
            uiView.goBack()
            viewModel.goBack = false
        }
        
        // 앞으로 가기
        if viewModel.goForward {
            uiView.goForward()
            viewModel.goForward = false
        }
        
        // 새로고침
        if viewModel.reload {
            uiView.reload()
            viewModel.reload = false
        }
        
    }

}
