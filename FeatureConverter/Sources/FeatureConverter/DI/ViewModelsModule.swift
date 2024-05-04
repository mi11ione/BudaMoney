//
//  ViewModelsModule.swift
//
//
//  Created by Maksim Zoteev on 04.05.2024.
//

import Foundation
import Factory

@MainActor extension Container {
    var currencyConverterViewModel: Factory<CurrencyConverterViewModel> {
        self { CurrencyConverterViewModel() }
    }
}
