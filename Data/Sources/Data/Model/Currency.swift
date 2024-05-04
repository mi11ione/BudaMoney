//
//  Currency.swift
//
//
//  Created by Maksim Zoteev on 04.05.2024.
//

import Foundation

public let DEFAULT_CURRENCIES = [
    Currency(name: "USD"),
    Currency(name: "EUR"),
    Currency(name: "RUB"),
    // TODO: add others
]

public struct Currency: Identifiable, Hashable {
    public let name: String
    
    public var id: String { name }
    
    public init(name: String) {
        self.name = name
    }
}
