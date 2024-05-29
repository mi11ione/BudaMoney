//
//  21.swift
//
//
//  Created by Maksim Zoteev on 26.05.2024.
//

import Foundation

struct Century21: Century {
    var id: String = "21"
    var upgrades: [any UserUpgrade] = [ITCompany(), ITMOUniversity(), ChatGPT()]
}

struct GreatRecession: HistoryEvent {
    var name: String = "Great Recession"
    var description: String = "Reduces the money received by 10 times"
    var story: String = "The crisis began due to the collapse of the US mortgage market and quickly escalated into an international banking crisis. This led to a significant increase in capital, a decrease in investment and an increase in unemployment in many countries."
    var id: String = "great_recession"
    var price: Double = 0

    var century: String = "21"
    var upgrades: [any UserUpgrade] = []
    var dates: Range<Int> = 100 ..< 200

    func affectMoney(_ money: Double, _: Int) -> Double {
        money / 10
    }
}

struct Covid: HistoryEvent {
    var name: String = "Covid-19"
    var description: String = "Reduces the money received by 2 times"
    var story: String = "The global health crisis caused by the novel coronavirus SARS-CoV-2 has led to a global economic downturn due to measures to restrict movement, which has greatly impacted all sectors of the economy, including tourism, hospitality and retail."
    var id: String = "covid_zomb"
    var price: Double = 0

    var century: String = "21"
    var upgrades: [any UserUpgrade] = []
    var dates: Range<Int> = 500 ..< 700

    func affectMoney(_ money: Double, _: Int) -> Double {
        money / 2
    }
}

struct ITCompany: UserUpgrade {
    var name: String = "IT company"
    var description: String = "Boosts the money received by 10 times"
    var id: String = "vkontakte"
    var price: Double = 1000

    func affectMoney(_ money: Double, _: Int) -> Double {
        money * 10
    }
}

struct ITMOUniversity: UserUpgrade {
    var name: String = "ITMO University"
    var description: String = "Boosts the money received by 100 times"
    var id: String = "itmo"
    var price: Double = 10000

    func affectMoney(_ money: Double, _: Int) -> Double {
        money * 100
    }
}

struct ChatGPT: UserUpgrade {
    var name: String = "AI"
    var description: String = "Boosts the money received by current day number times"
    var id: String = "chatgpt"
    var price: Double = 1_000_000

    func affectMoney(_ money: Double, _ day: Int) -> Double {
        money * Double(day)
    }
}
