//
//  ContentView.swift
//  BudaMoney
//
//  Created by Maksim Zoteev on 29.04.2024.
//

import SwiftUI
import FeatureConverter

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ClickerView()
                .toolbar {
                    ToolbarItem(placement: .confirmationAction) {
                        NavigationLink {
                            CurrencyConverterView()
                        } label: {
                            Image(systemName: "textformat.123")
                        }
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
