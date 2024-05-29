//
//  ViewModelsModule.swift
//
//
//  Created by Maksim Zoteev on 04.05.2024.
//

import Factory
import Foundation

@MainActor extension Container {
    var currencyConverterViewModel: Factory<CurrencyConverterViewModel> {
        self { CurrencyConverterViewModel() }
    }
}
