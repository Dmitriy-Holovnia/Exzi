//
//  BookResponse.swift
//  Exzi
//
//  Created by Dmitriy Holovnia on 17.02.2024.
//

import Foundation

struct BookResponse: Codable {
    let buy: [BookOffer]
    let sell: [BookOffer]
    
    static var buyMockData: [BookOffer] {
        [
            BookOffer(volume: 24223740, count: 1, rate: 5158295000000, price: 0, rateF: "51582.95", volumeF: "0.966553"),
            BookOffer(volume: 6200000, count: 1, rate: 5157937000000, price: 0, rateF: "51579.37", volumeF: "0.062"),
            BookOffer(volume: 24225670, count: 1, rate: 5157720000000, price: 0, rateF: "51577.2", volumeF: "0.242257"),
            BookOffer(volume: 24226050, count: 1, rate: 5157661000000, price: 0, rateF: "51576.61", volumeF: "0.242261"),
            BookOffer(volume: 9688400, count: 1, rate: 5157440000000, price: 0, rateF: "51574.4", volumeF: "0.096884"),
            BookOffer(volume: 24227730, count: 1, rate: 5157404000000, price: 0, rateF: "51574.04", volumeF: "0.242277"),
        ]
    }
    
    static var sellMockData: [BookOffer] {
        [
            BookOffer(volume: 5000000, count: 1, rate: 5160876000000, price: 0, rateF: "51608.76", volumeF: "0.966553"), 
            BookOffer(volume: 2359360, count: 1, rate: 5160884000000, price: 0, rateF: "51608.84", volumeF: "0.023594"),
            BookOffer(volume: 24222430, count: 1, rate: 5160959000000, price: 0, rateF: "51609.59", volumeF: "0.242224"),
            BookOffer(volume: 34334350, count: 1, rate: 5161185000000, price: 0, rateF: "51611.85", volumeF: "0.343344"),
            BookOffer(volume: 24219940, count: 1, rate: 5161323000000, price: 0, rateF: "51613.23", volumeF: "0.242199"),
            BookOffer(volume: 10292990, count: 1, rate: 5161325000000, price: 0, rateF: "51613.25", volumeF: "0.10293")
        ]
    }
}

struct BookOffer: Codable, Hashable {
    let volume: Int
    let count: Int
    let rate: Int
    let price: Int
    let rateF: String
    let volumeF: String
    
    var volumeInt: Double {
        min((Double(volumeF) ?? 0), 1)
    }
    
    enum CodingKeys: String, CodingKey {
        case volume = "volume"
        case count = "count"
        case rate = "rate"
        case price = "price"
        case rateF = "rate_f"
        case volumeF = "volume_f"
    }
}
