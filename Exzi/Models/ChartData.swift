//
//  ChartData.swift
//  Exzi
//
//  Created by Dmitriy Holovnia on 17.02.2024.
//

import Foundation

struct ChartData: Codable, Hashable {
    let low: Int
    let high: Int
    let volume: Int
    let time: Int
    let open: Int
    let close: Int
    let pairID: Int
    let pair: String?
    let lowF: String
    let highF: String
    let openF: String
    let closeF: String
    let volumeF: String

    enum CodingKeys: String, CodingKey {
        case low = "low"
        case high = "high"
        case volume = "volume"
        case time = "time"
        case open = "open"
        case close = "close"
        case pairID = "pair_id"
        case pair = "pair"
        case lowF = "low_f"
        case highF = "high_f"
        case openF = "open_f"
        case closeF = "close_f"
        case volumeF = "volume_f"
    }
    
    var date: Date {
        Date(timeIntervalSince1970: TimeInterval(time))
    }
}
