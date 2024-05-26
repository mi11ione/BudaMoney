//
//  20.swift
//  
//
//  Created by Maksim Zoteev on 26.05.2024.
//

import Foundation

struct Century20: Century {
    var id: String = "20"
    var upgrades: [any UserUpgrade] = [OilDerrick(), CarFactory(), ZombieLaboratory()]
}

struct GreatDepression: HistoryEvent {
    var name: String = "Great Depression"
    var description: String = "Reduces the money received by 10 times"
    var story: String = "A global economic crisis that began with the collapse of the stock market in the United States and spread throughout the world. This period was characterized by mass unemployment, declining production and banking crises."
    var id: String = "great_depression"
    var price: Double = 0
    
    var century: String = "20"
    var upgrades: [any UserUpgrade] = []
    var dates: Range<Int> = 0..<200
    
    func affectMoney(_ money: Double, _ day: Int) -> Double {
        money / 10
    }
}

struct WorldWar2: HistoryEvent {
    var name: String = "World War 2"
    var description: String = "Reduces the money received by 10 times"
    var story: String = "A global conflict affecting most of the world's nations. The war caused significant destruction and loss of life, but contributed to economic growth in a number of countries in the post-war years through reconstruction and innovation."
    var id: String = "second_world_war"
    var price: Double = 0
    
    var century: String = "20"
    var upgrades: [any UserUpgrade] = []
    var dates: Range<Int> = 500..<700
    
    func affectMoney(_ money: Double, _ day: Int) -> Double {
        money / 10
    }
}

struct OilDerrick: UserUpgrade {
    var name: String = "Oil derrick"
    var description: String = "Boosts the money received by 5 times"
    var id: String = "oil_derrick"
    var price: Double = 1000
    
    func affectMoney(_ money: Double, _ day: Int) -> Double {
        money * 5
    }
}

struct CarFactory: UserUpgrade {
    var name: String = "Car factory"
    var description: String = "Boosts the money received by 0-10 times"
    var id: String = "car_factory"
    var price: Double = 10000
    
    func affectMoney(_ money: Double, _ day: Int) -> Double {
        money * Double.random(in: 0...10)
    }
}

struct ZombieLaboratory: UserUpgrade {
    var name: String = "zombie Laboratory"
    var description: String = "Gives some money every 10 days"
    var id: String = "zombie_skat57666"
    var price: Double = 100_000
    
    func affectMoney(_ money: Double, _ day: Int) -> Double {
        if day % 10 == 0 {
            return money * Double.random(in: 1...50)
        } else {
            return money
        }
    }
}

public struct ToCentury21: TimeTravelUpgrade {
    public var name: String = "21th century"
    public var description: String = "Perform a time travel to the 21th century"
    public var id: String = "century_20"
    public var price: Double = 1_000_000
    public var newCentury: Century = Century21()
    
    public func affectMoney(_ money: Double, _ day: Int) -> Double {
        0
    }
}
