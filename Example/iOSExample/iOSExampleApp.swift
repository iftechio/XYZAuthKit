//
//  iOSExampleApp.swift
//  iOSExample
//

import SwiftUI
import XYZAuthKit

@main
struct iOSExampleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onOpenURL { url in
                    _ = XYZAuth.handleOpen(url)
                }
        }
    }
}
