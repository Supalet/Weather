//
//  WeatherViewModel.swift
//  Weather
//
//  Created by Supalert Kamolsin on 3/10/2566 BE.
//  Copyright (c) 2566 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import Alamofire
import CoreLocation
import Foundation
import SwiftUI

class WeatherViewModel: NSObject, ObservableObject {
    var inMemoryStore: IWeatherInMemoryStore
    
    var locationManager: CLLocationManager

    // display
    @Published var weatherDegree = "--"
    @Published var weatherImage = "cloud"
 
    override init() {
        self.inMemoryStore = WeatherInMemoryStore()
        self.locationManager = CLLocationManager()
        super.init()
        self.locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }
    //weathercode
    func requestWeather(latitude: CLLocationDegrees, longitute: CLLocationDegrees) {
        let urlString = "https://api.open-meteo.com/v1/forecast?latitude=\(latitude)&longitude=\(longitute)&hourly=temperature_2m,showers"
        AF.request(urlString, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil)
            .response { response in
                switch response.result {
                case .success(let data):
                    do{
                        let jsonData = try JSONDecoder().decode(WeatherModel.self, from: data!)
                        let dateFormat = DateFormatter()
                        dateFormat.timeZone = .current
                        dateFormat.locale = .current
                        dateFormat.calendar = Calendar(identifier: .gregorian)
                        dateFormat.dateFormat = "yyyy-MM-dd'T'HH:00"
                        let nowDate = dateFormat.string(from: Date())
                        if let index = jsonData.hourly.time.firstIndex(where: { $0 == nowDate }) {
                            self.getDataDisplay(showers: jsonData.hourly.showers?[index] ?? 0.0, temp: jsonData.hourly.temperature_2m?[index] ?? 0.0)
                        }
                    } catch {
                        print(error.localizedDescription)
                    }
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    func getDataDisplay(showers: Double, temp: Double) {
        weatherDegree = String(format: "%.1f", temp)
        switch showers {
        case 0...0.3:
            weatherImage = "sun.max"
            
        case 1...1.5:
            weatherImage = "cloud.fog"
        
        case 1.6...2.4:
            weatherImage = "cloud.drizzle"
            
        case 2.5...3.4:
            weatherImage = "cloud.rain"
 
        case 3.5...5:
            weatherImage = "cloud.bolt"
            
        default:
            weatherImage = "cloud"
        }
    }
}

// MARK: - CLLocationManagerDelegate
extension WeatherViewModel: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            requestWeather(latitude: lat, longitute: lon)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
