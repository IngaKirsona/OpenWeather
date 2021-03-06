//
//  AppearenceViewController.swift
//  OpenWeather
//
//  Created by Inga Kirsona on 20/09/2020.
//  Copyright © 2020 Inga Kirsona. All rights reserved.
//

import UIKit

class AppearenceViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabelText()
        
    }
    
    @IBAction func openSettingsTapped(_ sender: Any) {
        guard let settingsURL = URL(string: UIApplication.openSettingsURLString) else{
            return
        }
        if UIApplication.shared.canOpenURL(settingsURL){
            UIApplication.shared.open(settingsURL, options: [:]) {(success) in
                print(success)
            }
        }
    }
    func setLabelText(){
        var text = "Unable to specify UI style"
        if self.traitCollection.userInterfaceStyle == .dark {
            text = "Dark Mode is On. \nGo to settings if you would like \n to change to Light Mode."
        }else{
            text = "Light Mode is On. \nGo to settings if you would like \n to change to Dark Mode."
        }
        textLabel.text = text
    }
}

extension AppearenceViewController {
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        setLabelText()
    }
}


