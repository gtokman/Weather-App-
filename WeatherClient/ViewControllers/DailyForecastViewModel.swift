//
//  DailyForecastViewModel.swift
//  WeatherClient
//
//  Created by Gary Tokman on 5/27/19.
//  Copyright © 2019 Gary Tokman. All rights reserved.
//

import UIKit

struct DailyForecastViewModel {
    let dayOfTheWeek: String
    let high: Int
    let low: Int
    let image: UIImage?
    
    static func format(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter.string(from: date)
    }
}

extension DailyForecastViewModel {
    init?(dailyForecast: DailyDatum) {
        let date = Date(timeIntervalSince1970: TimeInterval(dailyForecast.time))
        dayOfTheWeek = DailyForecastViewModel.format(date)
        high = Int(dailyForecast.temperatureHigh)
        low = Int(dailyForecast.temperatureLow)
        image = UIImage(named: dailyForecast.icon)
    }
}
