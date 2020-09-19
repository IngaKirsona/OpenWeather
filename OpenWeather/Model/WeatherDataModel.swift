//
//  WeatherDataModel.swift
//  OpenWeather
//
//  Created by Inga Kirsona on 19/09/2020.
//  Copyright © 2020 Inga Kirsona. All rights reserved.
//

import Foundation


class WeatherDataModel{
    let apiUrl = "https://api.openweathermap.org/data/2.5/weather?q=riga&appid=07b4f6be8ea08861f2c833d09b334e2f"
    let apiId = "07b4f6be8ea08861f2c833d09b334e2f"
    
    var temp: Int = 0
    var condition: Int = 0
    var city: String = ""
    var weatherIconName: String = ""
    
    func updateWeatherIcon(condition: Int) -> String {
    switch (condition) {
        case 0...300 :
            return "tstorm1"
        case 301...500 :
            return "light_rain"
        case 501...600 :
            return "shower3"
        case 601...700 :
            return "snow4"
        case 701...771 :
            return "fog"
        case 772...799 :
            return "tstorm3"
        case 800 :
            return "sunny"
        case 801...804 :
            return "cloudy2"
        case 900...903, 905...1000  :
            return "tstorm3"
        case 903 :
            return "snow5"
        case 904 :
            return "sunny"
        default :
            return "dunno"
        }
    }
}
