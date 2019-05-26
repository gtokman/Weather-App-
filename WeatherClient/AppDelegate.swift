//
//  AppDelegate.swift
//  WeatherClient
//
//  Created by Gary Tokman on 5/12/19.
//  Copyright © 2019 Gary Tokman. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let locationService = LocationService()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        locationService.newestLocation = { location in
            guard let location = location else { return }
            print("Location is: \(location)")
        }
        locationService.statusUpdated = { [weak self] status in
            if status == .authorizedWhenInUse {
                self?.locationService.getLocation()
            }
        }
        
        switch locationService.status {
        case .notDetermined:
            locationService.getPermission()
        case .authorizedWhenInUse:
            locationService.getLocation()
        default: assertionFailure("Location is: \(locationService.status)")
        }
        return true
    }
}
