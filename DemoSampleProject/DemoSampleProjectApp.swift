//
//  DemoSampleProjectApp.swift
//  DemoSampleProject
//
//  Created by Varun Nagpal on 2025-07-16.
//

import SwiftUI

@main
struct DemoSampleProjectApp: App {
    @StateObject private var devCycleManager = DevCycleManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(devCycleManager)
                .onAppear {
                    devCycleManager.initialize()
                }
        }
    }
}
