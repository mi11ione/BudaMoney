//
//  CurrenciesCarouselView.swift
//  BudaMoney
//
//  Created by mi11ion on 4/5/24.
//

import Data
import Extensions
import SwiftUI

struct CurrenciesCarouselView: View {
    let currencies: [String]
    @Binding var selectedCurrency: String

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(currencies, id: \.self) { currency in
                    CurrencyButton(currency: currency, selectedCurrency: $selectedCurrency)
                        .padding(.trailing, 5)
                        .padding(.bottom, 1)
                }
            }
        }
    }
}

private struct CurrencyButton: View {
    var currency: String
    @Binding var selectedCurrency: String

    @Environment(\.colorScheme) private var colorScheme

    private var isSelected: Bool {
        currency == selectedCurrency
    }

    var body: some View {
        Button {
            withAnimation(.smooth) {
                selectedCurrency = currency
            }
        } label: {
            Text(currency)
                .font(.headline)
                .foregroundColor(isSelected ? colorScheme.colorOnSelectedBackground : colorScheme.colorOnSurface)
                .padding(.horizontal, 9)
                .padding(.vertical, 7)
                .background(backgroundView)
                .cornerRadius(10)
        }
    }

    private var backgroundView: some View {
        Group {
            if isSelected == false {
                Rectangle().fill(Material.ultraThin)
            } else {
                Rectangle().fill(colorScheme.colorSelectedBackground)
            }
        }
    }
}
