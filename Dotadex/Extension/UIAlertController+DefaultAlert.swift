//
//  UIAlertController+DefaultAlert.swift
//
//  Created by Rizki Dwi Putra on 03/04/20.
//  Copyright © 2020 Rizki Dwi Putra. All rights reserved.
//

import UIKit

extension UIAlertController {
    static var defaultAlert: UIAlertController {
        let alert = UIAlertController(title: "Warning",
                                      message: "Something went wrong!",
                                      preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK",
                                      style: UIAlertAction.Style.cancel))
        
        return alert
    }
}
