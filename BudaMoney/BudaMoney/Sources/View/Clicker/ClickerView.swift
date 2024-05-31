//
//  ClickerView.swift
//  BudaMoney
//
//  Created by Maksim Zoteev on 26.05.2024.
//

import FeatureConverter
import Foundation
import SwiftUI

struct ClickerView: View {
    @StateObject private var moneyStore = MoneyStore()

    @State private var infoOpened = false
    @State private var upgradesOpened = false

    @Environment(\.colorScheme) private var colorScheme

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
        ScrollView(.horizontal) {
            HStack(spacing: 10) {
                Button {
                    infoOpened = true
                } label: {
                    bottomButton("info", systemImage: "info")
                }

                Button {
                    upgradesOpened = true
                } label: {
                    bottomButton("upgrades", systemImage: "checkmark")
                }

                NavigationLink {
                    CurrencyConverterView()
                } label: {
                    bottomButton("converter", systemImage: "rublesign.circle")
                }

                NavigationLink {
                    SettingsView()
                } label: {
                    bottomButton("settings", systemImage: "wand.and.stars")
                }
            }
            .padding()
        }
        .scrollIndicators(.never)
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

    private func bottomButton(_ label: String, systemImage: String) -> some View {
        Label(label, systemImage: systemImage)
            .padding(9)
            .background(colorScheme == .light ? Color.white : Color(.systemGray6))
            .cornerRadius(12)
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 1)
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
