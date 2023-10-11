//
//  WeatherApp.swift
//  Weather
//
//  Created by Supalert Kamolsin on 3/10/2566 BE.
//

import SwiftUI
import netfox

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        NFX.sharedInstance().start()
        return true
    }
}

@main
struct WeatherApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            WeatherView()
        }
    }
}
