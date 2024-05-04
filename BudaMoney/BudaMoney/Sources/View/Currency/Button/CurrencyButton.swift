//
//  CurrencyButton.swift
//  BudaMoney
//
//  Created by mi11ion on 4/5/24.
//

import SwiftUI

struct CurrencyButton: View {
    @Environment(\.colorScheme) var colorScheme

    var currency: String
    @Binding var isSelected: Bool

    var onSelectionChange: ((Bool) -> Void)?

    var body: some View {
        Button(action: {
            withAnimation(.smooth) {
                let newState = !isSelected
                isSelected = newState
                onSelectionChange?(newState)
            }
        }) {
            Text(currency)
                .font(.headline)
                .foregroundColor(isSelected ? (colorScheme == .dark ? .black : .white) : (colorScheme == .dark ? .white : .black))
                .padding(.horizontal, 9)
                .padding(.vertical, 7)
                .background(backgroundView)
                .cornerRadius(10)
        }
        .padding(.trailing, 5)
        .padding(.bottom, 1)
    }

    private var backgroundView: some View {
        Group {
            if isSelected == false {
                Rectangle().fill(Material.ultraThin)
            } else {
                Rectangle().fill(colorScheme == .dark ? Color.white : Color.black)
            }
        }
    }
}
