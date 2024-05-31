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
    CurrencyRate(century: "18", rates: ["GBR": 4.8, "RUB": 4], usdValueIndex: 1),
    CurrencyRate(century: "19", rates: ["GBR": 5.57, "RUB": 3.45], usdValueIndex: 1.15),
    CurrencyRate(century: "20", rates: ["GBR": 64.4, "RUB": 690], usdValueIndex: 25.3),
    CurrencyRate(century: "21", rates: ["GBR": 1.5, "RUB": 90], usdValueIndex: 278.3)
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
    University(),
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
