//
//  CurrencyConverterViewModel.swift
//
//
//  Created by Maksim Zoteev on 04.05.2024.
//

import Foundation
import SwiftUI
import Factory
import CoreArch
import CoreDI
import Data

@Observable
final class CurrencyConverterViewModel: BaseViewModel {
    var startAmount = ""
    var startCentury = "18"
    var startCurrency = "USD"
    
    var endAmount = ""
    var endCentury = "21"
    var endCurrency = "USD"
    
    @ObservationIgnored @Injected(\.hapticFeedbackGenerator) private var hapticFeedbackGenerator
    
    func convertCurrency() {
        guard let amount = Double(startAmount) else {
            endAmount = "Invalid amount"
            return
        }
        guard let fromRateData = historicalRates.first(where: { $0.century == startCentury }),
              let toRateData = historicalRates.first(where: { $0.century == endCentury }) else {
            return
        }
            
        let usdAmount = (startCurrency == "USD" ? amount : amount / (fromRateData.rates[startCurrency] ?? 1)) * fromRateData.usdValueIndex
        let targetAmount = (endCurrency == "USD" ? usdAmount : usdAmount / toRateData.usdValueIndex) * (endCurrency == "USD" ? 1 : (toRateData.rates[endCurrency] ?? 1))

        endAmount = String(format: "%.2f \(endCurrency)", targetAmount)
        
        hapticFeedbackGenerator.notificationOccurred(.success)
    }
}
