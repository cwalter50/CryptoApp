//
//  CryptoAppApp.swift
//  CryptoApp
//
//  Created by Christopher Walter on 4/14/22.
//

import SwiftUI

@main
struct CryptoAppApp: App {
    
    @StateObject private var vm = HomeViewModel()
    
    var body: some Scene {
        
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
            .environmentObject(vm)
        }
    }
}
