//
//  InfoViewController.swift
//  OpenWeather
//
//  Created by Inga Kirsona on 19/09/2020.
//  Copyright © 2020 Inga Kirsona. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
    
    @IBOutlet weak var appInfoLabel: UILabel!
    var infoText = String()
    let appDescText = "This app is a homework project.\n In this app you can see the weather info based on your current location.\n By tapping refresh 🔄 button user can specify city and get city's weather information.\n Also you can check my other Xcode projects in GitHub by clicking on the links.\n\n Created by Inga Kirsona"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appInfoLabel.text = appDescText
    }
}
