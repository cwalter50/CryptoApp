//
//  UIApplication.swift
//  CryptoApp
//
//  Created by Christopher Walter on 4/30/22.
//

import Foundation
import SwiftUI


extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
