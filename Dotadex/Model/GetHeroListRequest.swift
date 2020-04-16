//
//  GetHeroListRequest.swift
//  Dotadex
//
//  Created by Rizki Dwi Putra on 16/04/20.
//  Copyright © 2020 Rizki Dwi Putra. All rights reserved.
//

import UIKit
import Alamofire

class GetHeroListRequest: APIRequest {
    func endpoint() -> String {
        return "/api/herostats"
    }
    
    func method() -> HTTPMethod {
        return .get
    }
}
