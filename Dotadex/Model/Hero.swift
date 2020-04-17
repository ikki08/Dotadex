//
//  Hero.swift
//  Dotadex
//
//  Created by Rizki Dwi Putra on 16/04/20.
//  Copyright © 2020 Rizki Dwi Putra. All rights reserved.
//

import UIKit
import SwiftyJSON

class Hero: NSObject {
    var name = ""
    var attackType = ""
    var primaryAttribute = ""
    var baseAgi = 0
    var baseStr = 0
    var baseInt = 0
    var baseHealth = 0
    var baseMinAttack = 0
    var baseMaxAttack = 0
    var baseMana = 0
    var moveSpeed = 0
    var roles = Array<String>()
    var imageURL = ""
    
    init(json: JSON) {
        super.init()
        
        setHeroData(json: json)
    }
    
    private func setHeroData(json: JSON) {
        name = json["localized_name"].string!
        attackType = json["attack_type"].string!
        primaryAttribute = json["primary_attr"].string!
        baseAgi = json["base_agi"].int!
        baseStr = json["base_str"].int!
        baseInt = json["base_int"].int!
        baseHealth = json["base_health"].int!
        baseMinAttack = json["base_attack_min"].int!
        baseMaxAttack = json["base_attack_max"].int!
        baseMana = json["base_mana"].int!
        moveSpeed = json["move_speed"].int!
        if let jsonRoles = json["roles"].array {
            for role in jsonRoles {
                roles.append(role.string!)
            }
        }
        
        imageURL = ServerURL + json["img"].string!
    }
}
