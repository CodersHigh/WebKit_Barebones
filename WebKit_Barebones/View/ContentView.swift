//
//  ContentView.swift
//  WebKit_Barebones
//
//  Created by 이로운 on 2022/08/01.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = WebViewStateModel()
    @State private var webAddress = "https://google.com"
    
    var body: some View {
        VStack {
            // 검색 바
            HStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField("웹 주소를 입력하세요.", text: $webAddress)
                        .foregroundColor(.primary)
                }
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                .foregroundColor(.secondary)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(15)
                Button("검색") {
                    viewModel.pageURLString = webAddress
                    viewModel.goToPage = true
                    hideKeyboard()
                }
            }
            .padding(.horizontal).padding(.top)
            // 웹 뷰
            WebView(viewModel: viewModel)
                .cornerRadius(15)
                .shadow(color: .black.opacity(0.2), radius: 5.0, x: 0, y: 0)
                .padding(.horizontal).padding(.bottom)
        }
        .toolbar {
            // Bottom Bar
            ToolbarItem(placement: .bottomBar) {
                HStack {
                    Button {  // 뒤로 가기 버튼
                        viewModel.goBack = true
                    } label: {
                        Image(systemName: "arrow.backward")
                    }
                    Spacer()
                    Button {  // 새로고침 버튼
                        viewModel.reload = true
                    } label: {
                        Image(systemName: "arrow.clockwise")
                    }
                    Spacer()
                    Button {  // 앞으로 가기 버튼
                        viewModel.goForward = true
                    } label: {
                        Image(systemName: "arrow.forward")
                    }
                }
                .padding(.bottom, 5)
            }
        }
    }
    
}
