//
//  ContentView.swift
//  BudaMoney
//
//  Created by Maksim Zoteev on 29.04.2024.
//

import FeatureConverter
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ClickerView()
                .toolbar {
                    ToolbarItem(placement: .confirmationAction) {
                        NavigationLink {
                            CurrencyConverterView()
                        } label: {
                            Image(systemName: "rublesign.circle")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.black)
                        }
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
