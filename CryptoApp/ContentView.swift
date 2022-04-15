//
//  ContentView.swift
//  CryptoApp
//
//  Created by Christopher Walter on 4/14/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            VStack(spacing: 40) {
                Text("AccentColor")
                    .foregroundColor(Color.theme.accent)
                Text("GreenColor")
                    .foregroundColor(Color.theme.green)
                Text("RedColor")
                    .foregroundColor(Color.theme.red)
                Text("SecondaryTextColor")
                    .foregroundColor(Color.theme.secondaryText)
                    
            }
            .font(.headline)
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                
        }
    }
}
