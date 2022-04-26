//
//  HideKeyboardExtension.swift
//  Check
//
//  Created by Salih Çakmak on 26.03.2022.
//

import SwiftUI

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

#endif
