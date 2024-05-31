//
//  ClickerUpgradesView.swift
//  BudaMoney
//
//  Created by Maksim Zoteev on 26.05.2024.
//

import Foundation
import SwiftUI

struct ClickerUpgradesView: View {
    @EnvironmentObject private var moneyStore: MoneyStore

    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            List {
                if !moneyStore.appliedUpgrades.isEmpty {
                    Section("Applied upgrades") {
                        ForEach(moneyStore.appliedUpgrades, id: \.id) { upgrade in
                            VStack(alignment: .leading) {
                                Text(upgrade.name)
                                    .bold()
                                Text(upgrade.description)
                            }
                        }
                    }
                }

                Section("Upgrades") {
                    let upgrades = moneyStore.availableUpgrades.filter { upgrade in
                        !moneyStore.appliedUpgrades.contains(where: { upgrade.id == $0.id })
                    }

                    if !upgrades.isEmpty {
                        ForEach(upgrades, id: \.id) { upgrade in
                            VStack(alignment: .leading) {
                                Text(upgrade.name)
                                    .bold()
                                Text(upgrade.description)

                                Button {
                                    moneyStore.buy(upgrade)
                                } label: {
                                    Text(String(format: "%.0f $", upgrade.price))
                                }
                                .buttonStyle(BorderedProminentButtonStyle())
                            }
                        }
                    } else {
                        Text("No upgrades are available now")
                    }
                }
            }
            .navigationTitle("Upgrades")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Dismiss")
                    }
                }
            }
        }
    }
}
