//
//  Currency.swift
//
//
//  Created by Maksim Zoteev on 04.05.2024.
//

import Foundation

public struct CurrencyRate {
    public let century: String
    public let rates: [String: Double]
    public let usdValueIndex: Double  // Индекс стоимости USD в этом веке
}

public let historicalRates: [CurrencyRate] = [
    CurrencyRate(century: "18", rates: ["EUR": 0.8, "RUB": 0.01], usdValueIndex: 0.04),
    CurrencyRate(century: "19", rates: ["EUR": 1.1, "RUB": 0.05], usdValueIndex: 0.09),
    CurrencyRate(century: "20", rates: ["EUR": 0.85, "RUB": 0.02], usdValueIndex: 0.5),
    CurrencyRate(century: "21", rates: ["EUR": 0.9, "RUB": 0.03], usdValueIndex: 1)
]
