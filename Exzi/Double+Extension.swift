//
//  Double+Extension.swift
//  Exzi
//
//  Created by Dmitriy Holovnia on 19.02.2024.
//

import Foundation

extension Double {
    var value: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 2
        return numberFormatter.string(from: NSNumber(value: self)) ?? ""
    }
}
