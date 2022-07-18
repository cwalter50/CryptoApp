//
//  DetailViewModel.swift
//  CryptoApp
//
//  Created by Christopher Walter on 7/18/22.
//

import Foundation
import Combine

class DetailViewModel: ObservableObject {
    private let coinDetailService: CoinDetailDataService
    private var cancellables = Set<AnyCancellable>()
    init(coin: CoinModel)
    {
        self.coinDetailService = CoinDetailDataService(coin: coin)
        self.addSubscribers()
    }
    
    private func addSubscribers() {
        coinDetailService.$coinDetails
            .sink{ (returnedCoinDetails) in
                print("Recieved COIN DETAIL DATA")
                print(returnedCoinDetails)
            }
        .store(in: &cancellables)
        
    }
}
