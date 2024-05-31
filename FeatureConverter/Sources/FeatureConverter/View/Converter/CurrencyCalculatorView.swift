//
//  CurrencyCalculatorView.swift
//  FeatureConverter
//
//  Created by mi11ion on 4/5/24.
//

import CoreDI
import Data
import Factory
import SwiftUI

@MainActor public struct CurrencyConverterView: View {
    @State private var viewModel = di.currencyConverterViewModel()
    @FocusState private var keyboardFocused: Bool

    @Environment(\.colorScheme) private var colorScheme

    public init() {}

    public var body: some View {
        List {
            Section(header: Text("Amount")) {
                TextField("Enter amount", text: $viewModel.startAmount)
                    .keyboardType(.decimalPad)
                    .focused($keyboardFocused)
            }

            Section(header: Text("Select Start Currency")) {
                CurrenciesCarouselView(
                    currencies: currencies,
                    selectedCurrency: $viewModel.startCurrency
                )
            }

            Section(header: Text("Select Start Century")) {
                CurrenciesCarouselView(
                    currencies: centuries,
                    selectedCurrency: $viewModel.startCentury
                )
            }

            Section(header: Text("Select End Currency")) {
                CurrenciesCarouselView(
                    currencies: currencies,
                    selectedCurrency: $viewModel.endCurrency
                )
            }

            Section(header: Text("Select End Century")) {
                CurrenciesCarouselView(
                    currencies: centuries,
                    selectedCurrency: $viewModel.endCentury
                )
            }

            Section(header: Text("Result")) {
                Text(viewModel.endAmount)
            }
        }
        .navigationBarTitle("Currency Calculator")
        .scrollDismissesKeyboard(.immediately)
        .overlay(alignment: .bottom) {
            Button {
                keyboardFocused = false
                viewModel.convertCurrency()
            } label: {
                Text("Convert")
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.extraLarge)
            .foregroundStyle(colorScheme.colorOnSelectedBackground)
            .tint(colorScheme.colorSelectedBackground)
            .font(.headline.weight(.bold))
            .cornerRadius(10)
            .padding()
        }
    }
}

private let currencies = ["USD", "GBR", "RUB"]
private let centuries = ["18", "19", "20", "21"]
