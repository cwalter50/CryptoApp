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
    
    private let fileManager = LocalFileManager.instance
    private let folderName = "coin_images"
    private let imageName: String
    
    
    init(coin: CoinModel) {
        self.coin = coin
        self.imageName = coin.id
        getCoinImage()
    }
    
    private func getCoinImage() {
        // try to get it from the file manager first, if its not there than download it from internet.
        if let savedImage = fileManager.getImage(imageName: imageName, folderName: folderName ){
            image = savedImage
            print("retreived Image from File Manager")
        }
        else {
            downloadCoinImage()
            print("Downloading image Now")
        }
    }
    
    private func downloadCoinImage()
    {

        guard let url = URL(string: coin.image) else { return } // coin.image is a urlString
        
        // Download Data using Combine. The teacher thinks it is the future of iOS Programming. Very powerful. A lot of the code for this has been refractored and put into static functions in NetworkingManager
        imageSubscription = NetworkingManager.download(url: url)
            .tryMap({ data -> UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedImage) in
                guard
                    let self = self,
                    let downloadedImage = returnedImage
                else { return }
                self.image = downloadedImage
                self.imageSubscription?.cancel()
                self.fileManager.saveImage(image: downloadedImage, imageName: self.imageName, folderName: self.folderName)
            })
    }
}
