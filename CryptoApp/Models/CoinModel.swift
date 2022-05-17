//
//  CoinModel.swift
//  CryptoApp
//
//  Created by Christopher Walter on 4/14/22.
//

import Foundation
// CoinGecko API Info
/*
 
 // Used CoinGecko which is a free Crypto API. Well documented, no API Key needed.
 // https://www.coingecko.com/en/api/documentation
 
 URL: https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h
 
 Use the following to make a model of your JSON Data
 https://app.quicktype.io/
 
 Sample Data:
 
 {
   "id": "bitcoin",
   "symbol": "btc",
   "name": "Bitcoin",
   "image": "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
   "current_price": 39979,
   "market_cap": 760427013635,
   "market_cap_rank": 1,
   "fully_diluted_valuation": 839946465406,
   "total_volume": 22477229653,
   "high_24h": 41523,
   "low_24h": 39708,
   "price_change_24h": -1422.90671803835,
   "price_change_percentage_24h": -3.43677,
   "market_cap_change_24h": -25437775525.388428,
   "market_cap_change_percentage_24h": -3.23692,
   "circulating_supply": 19011887,
   "total_supply": 21000000,
   "max_supply": 21000000,
   "ath": 69045,
   "ath_change_percentage": -42.09819,
   "ath_date": "2021-11-10T14:24:11.849Z",
   "atl": 67.81,
   "atl_change_percentage": 58857.02476,
   "atl_date": "2013-07-06T00:00:00.000Z",
   "roi": null,
   "last_updated": "2022-04-15T01:34:14.580Z",
   "sparkline_in_7d": {
     "price": [
       43515.15032279806,
       43369.66563801864,
       43644.6027344353,
       43681.84141415548,
       43646.64203286814,
       43587.3724601946,
       ... I deleted a bunch of rows of this
     ]
   },
   "price_change_percentage_24h_in_currency": -3.4367734995322365
 }
 
 */


struct CoinModel: Identifiable, Codable {
    let id, symbol, name: String
    let image: String
    let currentPrice: Double
    let marketCap, marketCapRank, fullyDilutedValuation: Double?
    let totalVolume, high24H, low24H: Double?
    let priceChange24H: Double?
    let priceChangePercentage24H: Double?
    let marketCapChange24H: Double?
    let marketCapChangePercentage24H: Double?
    let circulatingSupply, totalSupply, maxSupply, ath: Double?
    let athChangePercentage: Double?
    let athDate: String?
    let atl, atlChangePercentage: Double?
    let atlDate: String?
    let lastUpdated: String?
    let sparklineIn7D: SparklineIn7D?
    let priceChangePercentage24HInCurrency: Double?
    let currentHoldings: Double?
    
    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case currentPrice = "current_price"
        case marketCap = "market_cap"
        case marketCapRank = "market_cap_rank"
        case fullyDilutedValuation = "fully_diluted_valuation"
        case totalVolume = "total_volume"
        case high24H = "high_24h"
        case low24H = "low_24h"
        case priceChange24H = "price_change_24h"
        case priceChangePercentage24H = "price_change_percentage_24h"
        case marketCapChange24H = "market_cap_change_24h"
        case marketCapChangePercentage24H = "market_cap_change_percentage_24h"
        case circulatingSupply = "circulating_supply"
        case totalSupply = "total_supply"
        case maxSupply = "max_supply"
        case ath
        case athChangePercentage = "ath_change_percentage"
        case athDate = "ath_date"
        case atl
        case atlChangePercentage = "atl_change_percentage"
        case atlDate = "atl_date"
        case lastUpdated = "last_updated"
        case sparklineIn7D = "sparkline_in_7d"
        case priceChangePercentage24HInCurrency = "price_change_percentage_24h_in_currency"
        case currentHoldings
    }
    
    func updateHoldings(amount: Double) -> CoinModel {
        return CoinModel(id: id, symbol: symbol, name: name, image: image, currentPrice: currentPrice, marketCap: marketCap, marketCapRank: marketCapRank, fullyDilutedValuation: fullyDilutedValuation, totalVolume: totalVolume, high24H: high24H, low24H: low24H, priceChange24H: priceChange24H, priceChangePercentage24H: priceChangePercentage24H, marketCapChange24H: marketCapChange24H, marketCapChangePercentage24H: marketCapChangePercentage24H, circulatingSupply: circulatingSupply, totalSupply: totalSupply, maxSupply: maxSupply, ath: ath, athChangePercentage: athChangePercentage, athDate: athDate, atl: atl, atlChangePercentage: atlChangePercentage, atlDate: atlDate, lastUpdated: lastUpdated, sparklineIn7D: sparklineIn7D, priceChangePercentage24HInCurrency: priceChangePercentage24HInCurrency, currentHoldings: amount)
    }
    
    var currentHoldingsValue: Double {
        return (currentHoldings ?? 0) * currentPrice
    }
    
    var rank: Int {
        return Int(marketCapRank ?? 0)
    }
}

struct SparklineIn7D: Codable {
    let price: [Double]?
}
