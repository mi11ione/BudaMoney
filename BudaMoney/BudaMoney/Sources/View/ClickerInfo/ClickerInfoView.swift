//
//  ClickerInfoView.swift
//  BudaMoney
//
//  Created by Maksim Zoteev on 26.05.2024.
//

import Foundation
import SwiftUI

struct ClickerInfoView: View {
    
    @EnvironmentObject private var moneyStore: MoneyStore
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            List {
                Section("Ongoing events") {
                    if !moneyStore.ongoingEvents.isEmpty {
                        ForEach(moneyStore.ongoingEvents, id: \.id) { event in
                            VStack(alignment: .leading) {
                                Text(event.name)
                                    .bold()
                                Text(event.description)
                            }
                        }
                    } else {
                        Text("Nothing interesting is happening right now")
                    }
                }
                
                Section("Story") {
                    if !moneyStore.ongoingEvents.isEmpty {
                        ForEach(moneyStore.ongoingEvents, id: \.id) { event in
                            VStack(alignment: .leading) {
                                Text(event.name)
                                    .bold()
                                Text(event.story)
                            }
                        }
                    } else {
                        Text("\(moneyStore.centuryId)th century is an interesting period")
                    }
                }
            }
            .navigationTitle("Info")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Dismiss")
                    }
                }
            }
        }
    }
}
