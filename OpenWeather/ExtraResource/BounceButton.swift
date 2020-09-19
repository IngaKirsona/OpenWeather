//
//  BounceButton.swift
//  OpenWeather
//
//  Created by Inga Kirsona on 19/09/2020.
//  Copyright © 2020 Inga Kirsona. All rights reserved.
//

import UIKit
class BounceButton: UIButton {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 6, options: .allowUserInteraction, animations: {
            self.transform = CGAffineTransform.identity
        }, completion: nil)
        super.touchesBegan(touches, with: event)
    }
}

