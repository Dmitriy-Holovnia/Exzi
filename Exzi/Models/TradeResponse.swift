//
//  TradeResponse.swift
//  Exzi
//
//  Created by Dmitriy Holovnia on 18.02.2024.
//

import Foundation

struct TradeResponse: Codable {
    let status: Bool
    let data: [TradeData]
    let isLogin: Bool

    enum CodingKeys: String, CodingKey {
        case status
        case data
        case isLogin = "is_login"
    }
}

struct TradeData: Codable {
    let id: Int
    let rate: Int
    let percent: Double
}
