//
//  ContentView.swift
//  WebKit_Barebones
//
//  Created by 이로운 on 2022/08/01.
//

import SwiftUI

struct ContentView: View {
    @State private var showWebView = false
    private let urlString: String = "https://www.google.com"
    
    var body: some View {
        WebView(url: URL(string: urlString)!)
            .cornerRadius(15)
            .shadow(color: .black.opacity(0.2), radius: 5.0, x: 0, y: 0)
            .padding()
    }
    
}
