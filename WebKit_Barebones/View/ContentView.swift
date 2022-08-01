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
                }
            }
            .padding()
            WebView(webViewStateModel: viewModel)
                .cornerRadius(15)
                .shadow(color: .black.opacity(0.2), radius: 5.0, x: 0, y: 0)
                .padding()
        }
    }
    
}
