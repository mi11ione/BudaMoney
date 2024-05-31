//
//  CurrencyConverterViewModel.swift
//
//
//  Created by Maksim Zoteev on 04.05.2024.
//

import CoreArch
import CoreDI
import Data
import Factory
import Foundation
import SwiftUI

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
              let toRateData = historicalRates.first(where: { $0.century == endCentury })
        else {
            return
        }

        let usdAmount: Double
        if startCurrency == "USD" {
            usdAmount = amount / fromRateData.usdValueIndex
        } else {
            guard let fromCurrencyRate = fromRateData.rates[startCurrency] else {
                endAmount = "Invalid start currency"
                return
            }
            usdAmount = (amount / fromCurrencyRate) / fromRateData.usdValueIndex
        }

        let targetAmount: Double
        if endCurrency == "USD" {
            targetAmount = usdAmount * toRateData.usdValueIndex
        } else {
            guard let toCurrencyRate = toRateData.rates[endCurrency] else {
                endAmount = "Invalid end currency"
                return
            }
            targetAmount = (usdAmount * toRateData.usdValueIndex) * toCurrencyRate
        }

        endAmount = String(format: "%.2f \(endCurrency)", targetAmount)
        hapticFeedbackGenerator.notificationOccurred(.success)
    }
}
