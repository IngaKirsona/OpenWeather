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

class WeatherViewController: UIViewController, CLLocationManagerDelegate, ChangeCityDelegate {
    
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
//-------> longitude and latitude is only for current location
            let params: [String: String] = ["lat": latitude, "lon": longitude, "appid": weatherDataModel.apiId]
            getWeatherData(url: weatherDataModel.apiUrl, parameters: params)
        }
    }
    
//-------> if something went wrong with requesting weather, this will appear
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error: ", error)
        cityLabel.text = "Weather Unavailable!"
    }

    //MARK: Networking
    func getWeatherData(url: String, parameters: [String: String]){
        
        AF.request(url, method: .get, parameters: parameters).responseJSON { (response) in
            if response.value != nil {
                print("Got weather data")
                let weatherJSON:JSON = JSON(response.value!)
                print("weatherJSON: ", weatherJSON)
                self.updateWeatherData(json: weatherJSON)
            }else{
                print("error\(String(describing:response.error))")
                self.cityLabel.text = "Connection Issues!"
            }
        }
        
    }
    //MARK: - JSON Parsing with SwiftyJSON
    func updateWeatherData(json : JSON){
        if let tempResult = json["main"]["temp"].double{
            weatherDataModel.temp = Int(tempResult - 273.15)
            weatherDataModel.city = json["name"].stringValue
            weatherDataModel.condition = json["weather"] [0]["id"].intValue
            weatherDataModel.weatherIconName = weatherDataModel.updateWeatherIcon(condition: weatherDataModel.condition)
            updateUIWithWeatherData()
        }else{
//-------> in hometask use ui alert controller, have extension with alertcontroller, present ecerything on alertcontroller
            self.cityLabel.text = "Weather Unavailable!"
        }
    }
    //MARK: Update UI
//-------> update Ui with new weather data
    func updateUIWithWeatherData(){
        cityLabel.text = weatherDataModel.city
        temperatureLabel.text = "\(weatherDataModel.temp)°"
        weatherIcon.image = UIImage(named: weatherDataModel.weatherIconName)
    }
    
    //MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "changeCityName" {
            let destinationVC = segue.destination as!
            ChangeCityViewController
//-------> it will pass back what we are typing in the text field
            destinationVC.delegate = self
        }
    }
    
    
    //MARK: - ChangeCityDelegate Delegate
    func userEnteredNewCityName(city: String) {
        print(city)
        let params: [String: String] = ["q": city,"appid": weatherDataModel.apiId]
        getWeatherData(url: weatherDataModel.apiUrl, parameters: params)
    }
}

