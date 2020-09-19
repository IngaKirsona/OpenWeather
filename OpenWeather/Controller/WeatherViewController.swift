//
//  WeatherViewController.swift
//  OpenWeather
//
//  Created by Inga Kirsona on 19/09/2020.
//  Copyright © 2020 Inga Kirsona. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire
import SwiftyJSON

class WeatherViewController: UIViewController, CLLocationManagerDelegate{
    
    let weatherDataModel = WeatherDataModel()
    let locationManager = CLLocationManager()
    
    
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
//-------> how accurate location will be
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    //MARK: - Location Manager Delegate
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[locations.count - 1]
        if location.horizontalAccuracy > 0{
            locationManager.stopUpdatingLocation()
            
            print ("Longitude: \(location.coordinate.longitude), latitude: \(location.coordinate.latitude)")
            
            let latitude = String(location.coordinate.latitude)
            let longitude = String (location.coordinate.longitude)
            
            let params: [String: String] = ["lat": latitude, "long": longitude, "appid": weatherDataModel.apiId]
            getWeatherData(url: weatherDataModel.apiUrl, parameters: params)
        }
    }
    
//-------> if something went wrong with requesting weather, this will appear
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error: ", error)
        cityLabel.text = "Weather Unavailable ⛔️"
    }

    //MARK: Networking
    func getWeatherData(url: String, parameters: [String: String]){
        
        AF.request(url, method: .get, parameters: parameters).responseJSON { (response) in
            if response.value != nil {
                print("Got weather data")
                let weatherJSON:JSON = JSON(response.value!)
                print("weatherJSON: ", weatherJSON)
            }
        }
        
    }
}

