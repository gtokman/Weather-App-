//
//  AppDelegate.swift
//  WeatherClient
//
//  Created by Gary Tokman on 5/12/19.
//  Copyright © 2019 Gary Tokman. All rights reserved.
//

import UIKit
import Moya
import CoreLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let locationService = LocationService()
    let forecastProvider = MoyaProvider<ForecastProvider>()
    static let apiKey = Bundle.main.object(forInfoDictionaryKey: "DARKSKY_API_KEY") as! String

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Location service callbacks
        locationService.newestLocation = { [weak self] coordinate in
            guard let self = self, let coordinate = coordinate else { return }
            print("Location is: \(coordinate)")
            self.getForecast(for: coordinate)
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
    
    func getForecast(for coordinates: CLLocationCoordinate2D) {
        // Forecast request
        forecastProvider.request(.forecast(AppDelegate.apiKey, coordinates.latitude, coordinates.longitude)) { (result) in
            switch result {
            case .success(let response):
                do {
                    let forecast = try Forecast(data: response.data)
                    let viewModels = forecast.daily.data.compactMap(DailyForecastViewModel.init)
                    let forecastViewController = AppDelegate
                        .viewControllerInNav(ofType: ForecastTableViewController.self, in: self.window)
                    forecastViewController?.viewModels = viewModels
                } catch {
                    print("Failed to get forecast: \(error)")
                }
            case .failure(let error):
                print("Network request failed: \(error)")
            }
        }
    }
    
    static func viewControllerInNav<T>(ofType: T.Type, in window: UIWindow?) -> T? {
        return window?.rootViewController
            .flatMap { $0 as? UINavigationController }?
            .viewControllers
            .first(where: { $0 is T }) as? T
    }
}
