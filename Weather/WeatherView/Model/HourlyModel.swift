//
//  HourlyModel.swift
//  Weather
//
//  Created by Supalert Kamolsin on 10/10/2566 BE.
//

import Foundation

struct HourlyModel: Codable {
    var showers: [Double]?
    var temperature_2m: [Double]?
    var time: [String]
}
