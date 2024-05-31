//
//  ColorExtensions.swift
//
//
//  Created by Maksim Zoteev on 04.05.2024.
//

import Foundation
import SwiftUI

public extension ColorScheme {
    var colorOnSurface: Color {
        .secondary
    }

    var colorSelectedBackground: Color {
        self == .dark ? Color.white : Color.black
    }

    var colorOnSelectedBackground: Color {
        self == .dark ? Color.black : Color.white
    }
}
