//
//  SnapLensApp.swift
//  SnapLens
//
//  Created by Vijay Pratap Singh on 31/03/24.
//

import SwiftUI
import UIKit

@main
struct SnapLensApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    let navigationState = NavigationState()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(navigationState)
        }
    }
}
