//
//  SettingsView.swift
//  BudaMoney
//
//  Created by Maksim Zoteev on 31.05.2024.
//

import Foundation
import SwiftUI

struct SettingsView: View {
    var body: some View {
        List {
            Section("Application") {
                VStack(alignment: .leading, spacing: 5) {
                    Text("BudaMoney")
                        .bold()
                    Text("Clicker history game")
                }
            }

            Section("Authors") {
                Link("f0x1d", destination: URL(string: "https://t.me/f0x1d")!)
                Link("mi11ion", destination: URL(string: "https://t.me/mi11ion")!)
            }
        }
        .navigationTitle("Settings")
    }
}

#Preview {
    SettingsView()
}
