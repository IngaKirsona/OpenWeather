//
//  ChangeCityViewController.swift
//  OpenWeather
//
//  Created by Inga Kirsona on 19/09/2020.
//  Copyright © 2020 Inga Kirsona. All rights reserved.
//

import UIKit
protocol ChangeCityDelegate {
    func userEnteredNewCityName(city: String)
}

class ChangeCityViewController: UIViewController {
    
    var delegate: ChangeCityDelegate?
    @IBOutlet weak var cityTextField: DesignableTextField!
    
    
    @IBAction func getWeatherTapped(_ sender: Any) {
        guard  let cityName = cityTextField.text, cityName != "" else {
            warningPopUP(withTitle: "City name is empthy!", withMessage: "Please enter the city name!")
            return
        }
        delegate?.userEnteredNewCityName(city: cityName)
        //-------> to dismiss the view controller
        self.dismiss(animated: true, completion: nil)
    }
    
}
