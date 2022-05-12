//
//  MarketDataModel.swift
//  CryptoApp
//
//  Created by Christopher Walter on 5/11/22.
//

import Foundation

// JSON Data
/*
 
 URL: https://api.coingecko.com/api/v3/global
 
 JSON Response:
 {
   "data": {
     "active_cryptocurrencies": 13437,
     "upcoming_icos": 0,
     "ongoing_icos": 49,
     "ended_icos": 3376,
     "markets": 804,
     "total_market_cap": {
       "btc": 45701435.500137895,
       "eth": 634726496.1642821,
       "ltc": 19968243062.534695,
       "bch": 6812085969.475959,
       "bnb": 4905706082.7168455,
       "eos": 947404898627.6014,
       "xrp": 3218801250421.34,
       "xlm": 10507957235188.133,
       "link": 190534912216.22437,
       "dot": 145887173520.01526,
       "yfi": 114939966.87200648,
       "usd": 1347958771489.0083,
       "aed": 4951187363556.27,
       "ars": 157840697578690.5,
       "aud": 1941842447031.6372,
       "bdt": 117143947256785.9,
       "bhd": 508262682336.419,
       "bmd": 1347958771489.0083,
       "brl": 6926216555541.989,
       "cad": 1750461956573.1704,
       "chf": 1339942460674.9668,
       "clp": 1162115695663819.5,
       "cny": 9060439678440.518,
       "czk": 32574367284171.965,
       "dkk": 9527778332474.545,
       "eur": 1280493434975.9858,
       "gbp": 1101138084717.97,
       "hkd": 10581274162373.027,
       "huf": 486410142223679.75,
       "idr": 19610153627834572,
       "ils": 4630063145424.476,
       "inr": 104338074727721.19,
       "jpy": 174888888868684.62,
       "krw": 1729991834449956.5,
       "kwd": 413688546969.9774,
       "lkr": 486254044554064.6,
       "mmk": 2500914456455857,
       "mxn": 27339364505361.13,
       "myr": 5908507683067.788,
       "ngn": 561906369072824.06,
       "nok": 13131143068377.727,
       "nzd": 2142105985794.217,
       "php": 70511721988631.48,
       "pkr": 257238260776325.16,
       "pln": 5990560629405.876,
       "rub": 89976256084644.08,
       "sar": 5056166392679.854,
       "sek": 13578579111150.725,
       "sgd": 1873155859871.6448,
       "thb": 46743480393318.1,
       "try": 20608456392137.754,
       "twd": 40126942537979.31,
       "uah": 40863894513651.45,
       "vef": 134971111789.19481,
       "vnd": 31076859698565704,
       "zar": 21666542021653.145,
       "xdr": 984708145830.6068,
       "xag": 62356424493.61661,
       "xau": 725471410.8153862,
       "bits": 45701435500137.9,
       "sats": 4570143550013790
     },
     "total_volume": {
       "btc": 9051182.077220414,
       "eth": 125707760.01120856,
       "ltc": 3954716120.911553,
       "bch": 1349135530.6600688,
       "bnb": 971576461.1346596,
       "eos": 187633805032.29697,
       "xrp": 637484487502.8134,
       "xlm": 2081103868062.228,
       "link": 37735492630.883575,
       "dot": 28892995500.255623,
       "yfi": 22763892.571931884,
       "usd": 266963611532.43307,
       "aed": 980584041519.7784,
       "ars": 31260394281836.08,
       "aud": 384582439501.39276,
       "bdt": 23200391503288.223,
       "bhd": 100661566328.03114,
       "bmd": 266963611532.43307,
       "brl": 1371739125137.1045,
       "cad": 346679479863.2409,
       "chf": 265375978934.65042,
       "clp": 230157338410456.7,
       "cny": 1794422611276.402,
       "czk": 6451362547209.325,
       "dkk": 1886979162358.3113,
       "eur": 253602082775.23526,
       "gbp": 218080705515.56375,
       "hkd": 2095624305987.8767,
       "huf": 96333664649547.34,
       "idr": 3883796408260733.5,
       "ils": 916985300344.4135,
       "inr": 20664184868862.266,
       "jpy": 34636793332858.33,
       "krw": 342625366454055.2,
       "kwd": 81931132379.30386,
       "lkr": 96302749462440.98,
       "mmk": 495306807263557.06,
       "mxn": 5414568783354.167,
       "myr": 1170181598430.1174,
       "ngn": 111285713482951.72,
       "nok": 2600626555670.422,
       "nzd": 424244689339.54346,
       "php": 13964866252298.01,
       "pkr": 50946109460981.81,
       "pln": 1186432207391.3215,
       "rub": 17819822671571.605,
       "sar": 1001375167585.9283,
       "sek": 2689241389028.0557,
       "sgd": 370979041712.14636,
       "thb": 9257559359631.67,
       "try": 4081510549819.226,
       "twd": 7947152187644.433,
       "uah": 8093105732450.605,
       "vef": 26731066422.742607,
       "vnd": 6154780751232696,
       "zar": 4291064704546.057,
       "xdr": 195021723569.44983,
       "xag": 12349707303.493076,
       "xau": 143679815.72675586,
       "bits": 9051182077220.414,
       "sats": 905118207722041.4
     },
     "market_cap_percentage": {
       "btc": 41.65610290281266,
       "eth": 19.064701698892964,
       "usdt": 6.212684142188888,
       "usdc": 3.684895264604954,
       "bnb": 3.4431124731953844,
       "xrp": 1.5241195986723464,
       "ada": 1.327023328832764,
       "sol": 1.3179410753689194,
       "busd": 1.2834407587661496,
       "doge": 0.8535157586601132
     },
     "market_cap_change_percentage_24h_usd": -10.058556968270235,
     "updated_at": 1652319375
   }
 }
 */


// MARK: - QuoteSnapshot
struct GlobalData: Codable {
    let data: MarketDataModel
}

// MARK: - DataClass
struct MarketDataModel: Codable {
    let totalMarketCap, totalVolume, marketCapPercentage: [String: Double]
    let marketCapChangePercentage24HUsd: Double

    enum CodingKeys: String, CodingKey {

        case totalMarketCap = "total_market_cap"
        case totalVolume = "total_volume"
        case marketCapPercentage = "market_cap_percentage"
        case marketCapChangePercentage24HUsd = "market_cap_change_percentage_24h_usd"
    }
    
    var marketCap: String {
        if let item = totalMarketCap.first(where: { $0.key == "usd"}) {
            return "$" + item.value.formattedWithAbbreviations()
        }
        return ""
    }
    
    var volume: String {
        if let item = totalVolume.first(where: { $0.key == "usd"}) {
            return "$" + item.value.formattedWithAbbreviations()
        }
        return ""
    }
    
    var btcDominance: String {
        if let item = marketCapPercentage.first(where: { $0.key == "btc" }) {
            return item.value.asPercentString()
        }
        return ""
    }

}
