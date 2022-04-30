//
//  HomeViewModel.swift
//  CryptoApp
//
//  Created by Christopher Walter on 4/14/22.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    
    @Published var searchText: String = ""
    
    // this calls the init and gets the coins in the init.
    private let dataService = CoinDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init()
    {
        addSubscribers()
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//            self.allCoins.append(DeveloperPreview.instance.coin)
//            self.portfolioCoins.append(DeveloperPreview.instance.coin)
//        }
    }
    
    // this links the @Published allCoins from the CoinDataService to the @Published allCoins on this class. Everytime the allCoins from CoinDataService get updated it will automatically update and also update allCoins here because of the Published Modifier
    func addSubscribers() {
        dataService.$allCoins
            .sink { [weak self] returnedCoins in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
    }
}
