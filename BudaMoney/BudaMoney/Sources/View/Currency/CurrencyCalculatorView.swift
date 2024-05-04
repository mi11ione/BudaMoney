//
//  CurrencyCalculatorView.swift
//  BudaMoney
//
//  Created by mi11ion on 4/5/24.
//

import SwiftUI

struct CurrencyCalculatorView: View {
    @State private var amount = ""
    @State private var selectedStartCurrency = "USD"
    @State private var selectedEndCurrency = "USD"
    @State private var result = ""
    @State private var yearSelection = ""
    @Environment(\.colorScheme) var colorScheme
    @FocusState private var keyboardFocused: Bool

    var body: some View {
        ZStack {
            NavigationView {
                List {
                    Section(header: Text("Amount")) {
                        TextField("Enter amount", text: $amount)
                            .keyboardType(.decimalPad)
                            .focused($keyboardFocused)
                    }

                    Section(header: Text("Select Start Currency")) {
                        Currencies(selectedCurrency: $selectedStartCurrency)
                    }

                    Section(header: Text("Year")) {
                        TextField("Enter year", text: $yearSelection)
                            .keyboardType(.decimalPad)
                            .focused($keyboardFocused)
                    }

                    Section(header: Text("Select End Currency")) {
                        Currencies(selectedCurrency: $selectedEndCurrency)
                    }

                    Section(header: Text("Result")) {
                        Text(result)
                    }
                }
                .navigationBarTitle("Currency Calculator")
                .scrollDismissesKeyboard(.immediately)
            }
            VStack {
                Spacer()
                Button("Convert", action: convertCurrency)
                    .buttonStyle(.borderedProminent)
                    .controlSize(.extraLarge)
                    .tint(colorScheme == .dark ? .white : .black)
                    .font(.headline.weight(.bold))
                    .cornerRadius(10)
            }
            .padding()
        }
    }

    func convertCurrency() {
        result = "\(amount) \(selectedEndCurrency)"
        keyboardFocused = false
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
}
