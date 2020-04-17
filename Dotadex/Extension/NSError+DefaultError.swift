//
//  NSError+DefaultError.swift
//
//  Created by Rizki Dwi Putra on 03/04/20.
//  Copyright © 2020 Rizki Dwi Putra. All rights reserved.
//

import Foundation

extension NSError {
    static var defaultError: NSError {
        return NSError(domain: "",
                       code: StatusCode.errorGeneral,
                       userInfo: ["description": "Something went wrong!"])
    }
}
