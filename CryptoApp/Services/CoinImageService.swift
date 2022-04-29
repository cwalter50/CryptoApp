//
//  CoinImageService.swift
//  CryptoApp
//
//  Created by Christopher Walter on 4/29/22.
//

import Foundation
import SwiftUI
import Combine

class CoinImageService {
    @Published var image: UIImage? = nil
    
    private var imageSubscription: AnyCancellable?
    private let coin: CoinModel
    init(coin: CoinModel) {
        self.coin = coin
        getCoinImage()
    }
    
    private func getCoinImage()
    {
        guard let url = URL(string: coin.image) else { return } // coin.image is a urlString
        
        // Download Data using Combine. The teacher thinks it is the future of iOS Programming. Very powerful. A lot of the code for this has been refractored and put into static functions in NetworkingManager
        imageSubscription = NetworkingManager.download(url: url)
            .tryMap({ data -> UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedImage) in
                self?.image = returnedImage
                self?.imageSubscription?.cancel()
            })
    }
}
