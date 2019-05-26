//
//  AppDelegate.swift
//  WeatherClient
//
//  Created by Gary Tokman on 5/12/19.
//  Copyright © 2019 Gary Tokman. All rights reserved.
//

import UIKit
import Moya

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let locationService = LocationService()
    let forecastProvider = MoyaProvider<ForecastProvider>()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let apiKey = Bundle.main.object(forInfoDictionaryKey: "DARKSKY_API_KEY") as! String
        
        // Forecast request
        forecastProvider.request(.forecast(apiKey, 42.3601, -71.0589)) { (result) in
            switch result {
            case .success(let response):
               let forecast = try? Forecast(data: response.data)
               print("Forcast: \n\n", forecast)
            case .failure(let error):
                print("Network request failed: \(error)")
            }
        }

        // Location service callbacks
        locationService.newestLocation = { coordinate in
            guard let coordinate = coordinate else { return }
            print("Location is: \(coordinate)")
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
