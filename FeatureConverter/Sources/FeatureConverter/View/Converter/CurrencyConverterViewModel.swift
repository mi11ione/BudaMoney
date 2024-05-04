//
//  CurrencyConverterViewModel.swift
//
//
//  Created by Maksim Zoteev on 04.05.2024.
//

import Foundation
import SwiftUI
import CoreArch
import Data

@Observable
final class CurrencyConverterViewModel: BaseViewModel {
    var startAmount = ""
    var selectedStartCurrency = DEFAULT_CURRENCIES.first!
    var selectedEndCurrency = DEFAULT_CURRENCIES.first!
    var convertedAmount = ""
    var year = ""
    
    func convertCurrency() {
        convertedAmount = "\(startAmount) \(selectedEndCurrency.name)"
        UINotificationFeedbackGenerator().notificationOccurred(.success)
    }
}
