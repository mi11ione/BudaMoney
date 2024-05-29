//
//  19.swift
//
//
//  Created by Maksim Zoteev on 26.05.2024.
//

import Foundation

struct Century19: Century {
    var id: String = "19"
    var upgrades: [any UserUpgrade] = [Railway(), CoalMine(), Factory(), ToCentury20()]
}

struct GoldRush: HistoryEvent {
    var name: String = "Gold rush"
    var description: String = "Boosts the money received by 100 times"
    var story: String = "The California Gold Rush began after the discovery of gold at Sutter's Mill and attracted thousands of adventurers and entrepreneurs to the region, greatly accelerating the economic development and popularization of the western United States."
    var id: String = "gold_rush_19"
    var price: Double = 0

    var century: String = "19"
    var upgrades: [any UserUpgrade] = []
    var dates: Range<Int> = 200 ..< 250

    func affectMoney(_ money: Double, _: Int) -> Double {
        money * 100
    }
}

struct AmericanCivilWar: HistoryEvent {
    var name: String = "American Civil War"
    var description: String = "Reduces the money received by 10 times"
    var story: String = "Conflict between the northern and southern states of the United States, mainly caused by issues of slavery and public rights. The war had profound economic consequences for the country, including the destruction of infrastructure and agricultural production in the south."
    var id: String = "civil_war_19"
    var price: Double = 0

    var century: String = "19"
    var upgrades: [any UserUpgrade] = []
    var dates: Range<Int> = 1000 ..< 1100

    func affectMoney(_ money: Double, _: Int) -> Double {
        money / 10
    }
}

struct Railway: UserUpgrade {
    var name: String = "Railway"
    var description: String = "Boosts the money received by 10 times"
    var id: String = "railway_19"
    var price: Double = 10000

    func affectMoney(_ money: Double, _: Int) -> Double {
        money * 10
    }
}

struct CoalMine: UserUpgrade {
    var name: String = "Coal mine"
    var description: String = "Boosts the money received by 1-10 times"
    var id: String = "coal_mine_19"
    var price: Double = 5000

    func affectMoney(_ money: Double, _: Int) -> Double {
        money * Double.random(in: 1 ... 10)
    }
}

struct Factory: UserUpgrade {
    var name: String = "Factory"
    var description: String = "Boosts the money received by 100 times"
    var id: String = "factory_19"
    var price: Double = 100_000

    func affectMoney(_ money: Double, _: Int) -> Double {
        money * 100
    }
}

public struct ToCentury20: TimeTravelUpgrade {
    public var name: String = "20th century"
    public var description: String = "Perform a time travel to the 20th century"
    public var id: String = "century_20"
    public var price: Double = 1_000_000
    public var newCentury: Century = Century20()

    public func affectMoney(_: Double, _: Int) -> Double {
        0
    }
}
