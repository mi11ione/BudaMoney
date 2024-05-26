//
//  UINotificationModule.swift
//
//
//  Created by Maksim Zoteev on 05.05.2024.
//

import Foundation
import SwiftUI
import Factory

public extension Container {
    var hapticFeedbackGenerator: Factory<UINotificationFeedbackGenerator> {
        self { UINotificationFeedbackGenerator() }
    }
}
