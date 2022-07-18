//
//  DetailView.swift
//  CryptoApp
//
//  Created by Christopher Walter on 7/17/22.
//

import SwiftUI

struct DetailLoadingView: View {
    
    @Binding var coin: CoinModel?
    
    var body: some View {
        ZStack {
            if let coin = coin {
                DetailView(coin: coin)
            }
        }
    }
}
struct DetailView: View {
    
//    var coin: CoinModel
    @StateObject var vm : DetailViewModel
    
    init(coin: CoinModel) {
//        self.coin = coin
        _vm = StateObject(wrappedValue: DetailViewModel(coin: coin))
        print("initializing Detail View for \(coin.name)")
        
    }
    
    var body: some View {
        Text("hello")
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(coin: dev.coin)
    }
}
