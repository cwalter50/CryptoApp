//
//  CoinDetailDataService.swift
//  CryptoApp
//
//  Created by Christopher Walter on 7/18/22.
//

import Foundation
import Combine


class CoinDetailDataService {
    
    @Published var coinDetails: CoinDetailModel? = nil
    
    var coinDetailSubscription: AnyCancellable?
    let coin: CoinModel
    
    init(coin: CoinModel)
    {
        self.coin = coin
        getCoinDetails()
    }
    
    public func getCoinDetails()
    {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/\(coin.id)?localization=false&tickers=false&market_data=false&community_data=false&developer_data=false&sparkline=false") else { return }
        
        // Download Data using Combine. The teacher thinks it is the future of iOS Programming. Very powerful. A lot of the code for this has been refractored and put into static functions in NetworkingManager
        coinDetailSubscription = NetworkingManager.download(url: url)
            .decode(type: CoinDetailModel.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedCoinDetails) in
                self?.coinDetails = returnedCoinDetails
                self?.coinDetailSubscription?.cancel()
            })
    }
}

