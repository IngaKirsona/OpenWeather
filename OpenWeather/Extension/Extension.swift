//
//  Extension.swift
//  OpenWeather
//
//  Created by Inga Kirsona on 19/09/2020.
//  Copyright © 2020 Inga Kirsona. All rights reserved.
//

import UIKit
extension UIViewController {
    func warningPopUP(withTitle title: String?, withMessage message: String?){
        
        DispatchQueue.main.async {
            
            let popUP = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okButton = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            popUP.addAction(okButton)
            self.present(popUP, animated: true)
        }
    }
}

