//
//  CurrencyConverterView.swift
//  FeatureConverter
//
//  Created by mi11ion on 4/5/24.
//

import SwiftUI
import CoreDI
import Factory
import Data

@MainActor public struct CurrencyConverterView: View {
    
    @State private var viewModel = di.currencyConverterViewModel()
    @FocusState private var keyboardFocused: Bool
    
    @Environment(\.colorScheme) private var colorScheme
    
    public init() { }

    public var body: some View {
        NavigationView {
            List {
                Section(header: Text("Amount")) {
                    TextField("Enter amount", text: $viewModel.startAmount)
                        .keyboardType(.decimalPad)
                        .focused($keyboardFocused)
                }

                Section(header: Text("Select Start Currency")) {
                    CurrenciesCarouselView(
                        currencies: DEFAULT_CURRENCIES,
                        selectedCurrency: $viewModel.selectedStartCurrency
                    )
                }

                Section(header: Text("Year")) {
                    TextField("Enter year", text: $viewModel.year)
                        .keyboardType(.decimalPad)
                        .focused($keyboardFocused)
                }

                Section(header: Text("Select End Currency")) {
                    CurrenciesCarouselView(
                        currencies: DEFAULT_CURRENCIES,
                        selectedCurrency: $viewModel.selectedEndCurrency
                    )
                }

                Section(header: Text("Result")) {
                    Text(viewModel.convertedAmount)
                }
            }
            .navigationBarTitle("Currency Calculator")
            .scrollDismissesKeyboard(.immediately)
        }
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
