//
//  NetworkManager.swift
//  Exzi
//
//  Created by Dmitriy Holovnia on 17.02.2024.
//

import Foundation

enum NetworkError: Error {
    case badURL
}

enum NetworEndpoint {
    case book
    case chart
    case trade
    
    var url: String {
        switch self {
        case .book: return "https://socket.exzi.com/book/list?pair_id=1041&buy=1&sell=1"
        case .chart: return "https://socket.exzi.com/graph/hist?t=BTCUSDT&r=D&limit=5000&end=1705363200"
        case .trade: return "https://api.exzi.com/api/default/ticker"
        }
    }
}

final class NetworkManager {
    static let shared = NetworkManager()
    
    private let bookEndpoint = "https://socket.exzi.com/book/list?pair_id=1041&buy=1&sell=1"
    private let decoder = JSONDecoder()
    
    private init() {}
    
    func fetchObject<T: Codable>(type: T.Type, endpoint: NetworEndpoint) async throws -> T {
        guard let url = URL(string: endpoint.url) else { throw NetworkError.badURL }
        let request = URLRequest(url: url)
        let (data, _) = try await URLSession.shared.data(for: request)
        let model = try decoder.decode(T.self, from: data)
        return model
    }
}
