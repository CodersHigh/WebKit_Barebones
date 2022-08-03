//
//  WebViewStateModel.swift
//  WebKit_Barebones
//
//  Created by 이로운 on 2022/08/01.
//

import Foundation

class WebViewStateModel: ObservableObject {
    
    @Published var pageURLString: String = "https://goole.com"
    @Published var goToPage: Bool = false
    
    @Published var goBack: Bool = false
    @Published var goForward: Bool = false
    @Published var reload: Bool = false
    
}
