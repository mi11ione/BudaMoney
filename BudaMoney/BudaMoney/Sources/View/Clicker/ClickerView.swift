//
//  ClickerView.swift
//  BudaMoney
//
//  Created by Maksim Zoteev on 26.05.2024.
//

import Foundation
import SwiftUI

struct ClickerView: View {
    @StateObject private var moneyStore = MoneyStore()

    @State private var infoOpened = false
    @State private var upgradesOpened = false

    var body: some View {
        VStack {
            Text("day \(moneyStore.currentDay)")
                .foregroundStyle(.secondary)

            Spacer()

            Text("balance").font(.headline)
                .foregroundStyle(.secondary)
            Text(String(format: "%.2f $", moneyStore.amount))
                .font(.largeTitle)
                .bold()

            Spacer()

            clickButton

            Spacer()
            Spacer()

            bottomButtons
        }
        .sheet(isPresented: $infoOpened) {
            ClickerInfoView()
        }
        .sheet(isPresented: $upgradesOpened) {
            ClickerUpgradesView()
        }
        .environmentObject(moneyStore)
    }

    private var bottomButtons: some View {
        HStack {
            Button {
                infoOpened = true
            } label: {
                Label("info", systemImage: "info")
            }

            Spacer()

            Button {
                upgradesOpened = true
            } label: {
                Label("upgrades", systemImage: "checkmark")
            }
        }
        .padding(.horizontal)
    }

    private var clickButton: some View {
        VStack {
            Button {
                moneyStore.click()
            } label: {
                Image(systemName: "dollarsign.circle")
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
            }
            .buttonStyle(ClickButtonStyle())
        }
        .frame(width: 200, height: 200)
    }

    private struct ClickButtonStyle: ButtonStyle {
        var pressedSize: CGFloat = 260
        var defaultSize: CGFloat = 180

        func makeBody(configuration: Self.Configuration) -> AnyView {
            if configuration.isPressed {
                return AnyView(
                    configuration.label
                        .frame(width: pressedSize)
                )
            } else {
                return AnyView(
                    configuration.label
                        .frame(width: defaultSize)
                )
            }
        }
    }
}

#Preview {
    ClickerView()
}
