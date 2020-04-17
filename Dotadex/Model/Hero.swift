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
    var attackType = "" // Melee or Ranged
    var baseAgi = 0
    var baseStr = 0
    var baseInt = 0
    var baseHealth = 0
    var baseMaxAttack = 0
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
        baseAgi = json["base_agi"].int!
        baseStr = json["base_str"].int!
        baseInt = json["base_int"].int!
        baseHealth = json["base_health"].int!
        baseMaxAttack = json["base_attack_max"].int!
        moveSpeed = json["move_speed"].int!
        if let jsonRoles = json["roles"].array {
            for role in jsonRoles {
                roles.append(role.string!)
            }
        }
        
        imageURL = ServerURL + json["img"].string!
    }
}

//{
//  "id": 1,
//  "name": "npc_dota_hero_antimage",
//  "localized_name": "Anti-Mage",
//  "primary_attr": "agi",
//  "attack_type": "Melee",
//  "roles": [
//    "Carry",
//    "Escape",
//    "Nuker"
//  ],
//  "img": "/apps/dota2/images/heroes/antimage_full.png?",
//  "icon": "/apps/dota2/images/heroes/antimage_icon.png",
//  "base_health": 200,
//  "base_health_regen": 0.25,
//  "base_mana": 75,
//  "base_mana_regen": 0,
//  "base_armor": -1,
//  "base_mr": 25,
//  "base_attack_min": 29,
//  "base_attack_max": 33,
//  "base_str": 23,
//  "base_agi": 24,
//  "base_int": 12,
//  "str_gain": 1.3,
//  "agi_gain": 3,
//  "int_gain": 1.8,
//  "attack_range": 150,
//  "projectile_speed": 0,
//  "attack_rate": 1.4,
//  "move_speed": 310,
//  "turn_rate": 0.5,
//  "cm_enabled": true,
//  "legs": 2,
//  "pro_ban": 118,
//  "hero_id": 1,
//  "pro_win": 47,
//  "pro_pick": 92,
//  "1_pick": 14853,
//  "1_win": 7518,
//  "2_pick": 43016,
//  "2_win": 22108,
//  "3_pick": 67159,
//  "3_win": 34474,
//  "4_pick": 74838,
//  "4_win": 38534,
//  "5_pick": 51973,
//  "5_win": 26582,
//  "6_pick": 22008,
//  "6_win": 11215,
//  "7_pick": 7318,
//  "7_win": 3611,
//  "8_pick": 1294,
//  "8_win": 627,
//  "null_pick": 2105360,
//  "null_win": 0
//}
