//
//  Currencies.swift
//  BudaMoney
//
//  Created by mi11ion on 4/5/24.
//

import SwiftUI

struct Currencies: View {
    let currencyKeys = [
        "USD",
        "EUR",
        "GBP",
        "RUB",
        "JPY",
    ]

    var currencies: [String] {
        currencyKeys.map { NSLocalizedString($0, comment: "") }
    }

    @Binding var selectedCurrency: String

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(currencies, id: \.self) { currency in
                    CurrencyButton(currency: currency, isSelected: .constant(currency == selectedCurrency), onSelectionChange: { isSelected in
                        selectedCurrency = isSelected ? currency : ""
                    })
                }
            }
        }
    }
}
