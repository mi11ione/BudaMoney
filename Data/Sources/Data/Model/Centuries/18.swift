//
//  18.swift
//
//
//  Created by Maksim Zoteev on 26.05.2024.
//

import Foundation

struct Century18: Century {
    var id: String = "18"
    var upgrades: [any UserUpgrade] = [Farm(), Shop(), ToCentury19()]
}

struct IndustrialRevolution: HistoryEvent {
    var name: String = "Industrial Revolution"
    var description: String = "Boosts the money received by 10 times and opens many upgrades"
    var story: String = "The Industrial Revolution began in Britain at the beginning of the second eighteenth century and quickly spread throughout the world. It was a period of significant technological innovation that led to a massive shift from manual labor to machine production, changing the structure of the economy and society."
    var id: String = "ind_rev"
    var price: Double = 0

    var century: String = "18"
    var upgrades: [any UserUpgrade] = [Loom()]
    var dates: Range<Int> = 50 ..< Int.max

    func affectMoney(_ money: Double, _: Int) -> Double {
        money * 10
    }

    struct Loom: UserUpgrade {
        var name: String = "Loom"
        var description: String = "Boosts the money received by 2 times"
        var id: String = "loom"
        var price: Double = 1000

        func affectMoney(_ money: Double, _: Int) -> Double {
            money * 2
        }
    }
}

struct IndependenceAmericanWar: HistoryEvent {
    var name: String = "American War of Independence"
    var description: String = "Reduces the money received by 2 times"
    var story: String = "The conflict between Great Britain and its established colonies culminated in the creation of the independent countries of the United States. The war had significant economic consequences for both the colonies and Great Britain, including economic instability and casualties."
    var id: String = "war_of_ind_america_18"
    var price: Double = 0

    var century: String = "18"
    var upgrades: [any UserUpgrade] = []
    var dates: Range<Int> = 200 ..< 300

    func affectMoney(_ money: Double, _: Int) -> Double {
        money / 2
    }
}

struct Farm: UserUpgrade {
    var name: String = "Farm"
    var description: String = "Consumes 10$ every day, but gives you 1000$ every 10 days"
    var id: String = "farm18"
    var price: Double = 10000

    func affectMoney(_ money: Double, _ day: Int) -> Double {
        if day % 10 == 0 {
            money + 1000
        } else {
            money - 10
        }
    }
}

struct Shop: UserUpgrade {
    var name: String = "Shop"
    var description: String = "Sometimes consumes some money and sometimes gives you money"
    var id: String = "shop18"
    var price: Double = 100_000

    func affectMoney(_ money: Double, _: Int) -> Double {
        if Bool.random() {
            money + Double.random(in: -1000 ... 10000)
        } else {
            money
        }
    }
}

public struct ToCentury19: TimeTravelUpgrade {
    public var name: String = "19th century"
    public var description: String = "Perform a time travel to the 19th century"
    public var id: String = "century_19"
    public var price: Double = 1_000_000
    public var newCentury: Century = Century19()

    public func affectMoney(_: Double, _: Int) -> Double {
        0
    }
}
