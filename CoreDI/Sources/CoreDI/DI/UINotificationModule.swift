//
//  UINotificationModule.swift
//
//
//  Created by Maksim Zoteev on 05.05.2024.
//

import Factory
import Foundation
import SwiftUI

public extension Container {
    var hapticFeedbackGenerator: Factory<UINotificationFeedbackGenerator> {
        self { UINotificationFeedbackGenerator() }
    }
}
