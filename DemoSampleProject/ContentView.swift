//
//  ContentView.swift
//  DemoSampleProject
//
//  Created by Varun Nagpal on 2025-07-16.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var devCycleManager: DevCycleManager

    var body: some View {
        VStack(spacing: 20) {
            if devCycleManager.isFeatureAEnabled {
                Button("Feature A") {
                    // Action for Feature A
                }
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.black, lineWidth: 1)
                )
            }

            if devCycleManager.isFeatureBEnabled {
                Button("Feature B") {
                    // Action for Feature B
                }
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.black, lineWidth: 1)
                )
            }

            if devCycleManager.isFeatureCEnabled {
                Button("Feature C") {
                    // Action for Feature C
                }
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.black, lineWidth: 1)
                )
            }

            if devCycleManager.isFeatureDEnabled {
                Button("Feature D") {
                    // Action for Feature D
                }
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.black, lineWidth: 1)
                )
            }
        }
        .padding()
    }
}

