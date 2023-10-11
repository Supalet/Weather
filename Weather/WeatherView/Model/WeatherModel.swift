//
//  WeatherModel.swift
//  Weather
//
//  Created by Supalert Kamolsin on 10/10/2566 BE.
//

import Foundation

struct WeatherModel: Codable {
    var hourly: HourlyModel
    var generationtime_ms: Double
    var longitude: Double
    var utc_offset_seconds: Double
    var elevation: Double
    var hourly_units: HourlyUnitsModel
    var timezone: String
    var latitude: Double
    var timezone_abbreviation: String
}
