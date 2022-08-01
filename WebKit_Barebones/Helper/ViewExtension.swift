//
//  ViewExtension.swift
//  WebKit_Barebones
//
//  Created by 이로운 on 2022/08/01.
//

import SwiftUI

extension View {
    
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
}

