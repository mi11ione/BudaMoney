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
    public let usdValueIndex: Double // Индекс стоимости USD в этом веке
}

public let historicalRates: [CurrencyRate] = [
    CurrencyRate(century: "18", rates: ["EUR": 0.82, "RUB": 0.015], usdValueIndex: 0.04),
    CurrencyRate(century: "19", rates: ["EUR": 1.05, "RUB": 0.02], usdValueIndex: 0.09),
    CurrencyRate(century: "20", rates: ["EUR": 0.85, "RUB": 0.015], usdValueIndex: 0.5),
    CurrencyRate(century: "21", rates: ["EUR": 0.9, "RUB": 0.014], usdValueIndex: 1),
]

public protocol Century {
    var id: String { get }
    var upgrades: [any UserUpgrade] { get }
}

public protocol UserUpgrade: Identifiable {
    var name: String { get }
    var description: String { get }
    var id: String { get }
    var price: Double { get }

    func affectMoney(_ money: Double, _ day: Int) -> Double
}

public protocol TimeTravelUpgrade: UserUpgrade {
    var newCentury: Century { get }
}

public protocol HistoryEvent: UserUpgrade {
    var story: String { get }
    var century: String { get }
    var upgrades: [any UserUpgrade] { get }
    var dates: Range<Int> { get }
}

public let centuries: [any Century] = [
    Century18(),
    Century19(),
    Century20(),
    Century21(),
]

public let events: [any HistoryEvent] = [
    IndustrialRevolution(),
    IndependenceAmericanWar(),

    GoldRush(),
    AmericanCivilWar(),

    GreatDepression(),
    WorldWar2(),

    GreatRecession(),
    Covid(),
]

public let upgrades: [any UserUpgrade] = [
    IndustrialRevolution.Loom(),
    Farm(),
    Shop(),
    ToCentury19(),

    Railway(),
    CoalMine(),
    Factory(),
    ToCentury20(),

    OilDerrick(),
    CarFactory(),
    ZombieLaboratory(),
    ToCentury21(),

    ITCompany(),
    ITMOUniversity(),
    ChatGPT(),
]
