//
//  CurrenciesCarouselView.swift
//  BudaMoney
//
//  Created by mi11ion on 4/5/24.
//

import SwiftUI
import Extensions
import Data

struct CurrenciesCarouselView: View {
    let currencies: [Currency]
    @Binding var selectedCurrency: Currency

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

fileprivate struct CurrencyButton: View {
    var currency: Currency
    @Binding var selectedCurrency: Currency
    
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
            Text(currency.name)
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
