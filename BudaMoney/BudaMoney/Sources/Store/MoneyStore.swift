//
//  MoneyStore.swift
//  BudaMoney
//
//  Created by Maksim Zoteev on 26.05.2024.
//

import Foundation
import SwiftUI
import AlertKit
import Data

final class MoneyStore: ObservableObject {
    
    @AppStorage("money") var amount: Double = 0
    @AppStorage("current_day") var currentDay: Int = 1
    
    @AppStorage("century_id") var centuryId = "18"
    @AppStorage("applied_upgrades") var appliedUpgradesIds: [String] = []
    
    @Published var century: (any Century)? = nil
    @Published var ongoingEvents: [any HistoryEvent] = []
    @Published var appliedUpgrades: [any UserUpgrade] = []
    @Published var availableUpgrades: [any UserUpgrade] = []
    
    init() {
        century = centuries.first(where: { $0.id == centuryId })!
        
        ongoingEvents = events.filter {
            $0.dates.contains(currentDay) && $0.century == century?.id
        }
        
        appliedUpgrades = appliedUpgradesIds.compactMap { id in
            upgrades.first(where: { $0.id == id })
        }
        availableUpgrades = ongoingEvents.flatMap { $0.upgrades } + (century?.upgrades ?? [])
    }
    
    func click() {
        var amount: Double = 1
        
        (appliedUpgrades + ongoingEvents).forEach {
            amount = $0.affectMoney(amount, currentDay)
        }
        
        self.amount += amount
        self.currentDay += 1
        
        updateState()
    }
    
    func buy(_ upgrade: any UserUpgrade) {
        if upgrade.price > amount { return }
        
        if let upgrade = upgrade as? any TimeTravelUpgrade {
            century = upgrade.newCentury
            
            withAnimation {
                amount = 0
                currentDay = 1
                
                appliedUpgrades = []
                ongoingEvents = []
            }
            
            updateState()
        } else {
            amount -= upgrade.price
            
            withAnimation {
                appliedUpgrades.append(upgrade)
            }
        }
        
        save()
    }
    
    private func updateState() {
        let previousCount = ongoingEvents.count
        ongoingEvents = events.filter {
            $0.dates.contains(currentDay) && $0.century == century?.id
        }
        
        withAnimation {
            availableUpgrades = ongoingEvents.flatMap { $0.upgrades } + (century?.upgrades ?? [])
        }
        
        if previousCount != ongoingEvents.count {
            AlertKitAPI.present(
                title: "Something happened...",
                subtitle: "Check info tab",
                icon: .heart,
                style: .iOS17AppleMusic
            )
        }
    }
    
    private func save() {
        centuryId = century?.id ?? "18"
        appliedUpgradesIds = appliedUpgrades.map { $0.id }
    }
}
