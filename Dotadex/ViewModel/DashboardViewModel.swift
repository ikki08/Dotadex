//
//  DashboardViewModel.swift
//  Dotadex
//
//  Created by Rizki Dwi Putra on 16/04/20.
//  Copyright © 2020 Rizki Dwi Putra. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class DashboardViewModel: NSObject {
    private var heroList = Array<Hero>()
    var filteredHeroList = Array<Hero>()
    var heroRoleList = Array<String>()
    var selectedIndex = -1
    var selectedHero: Hero { return filteredHeroList[selectedIndex] }
    var similarHeroes: [Hero] {
        var tempHeroList = heroList
        tempHeroList.removeAll(where: { $0.name == selectedHero.name })
        switch selectedHero.primaryAttribute {
        case "str":
            tempHeroList.sort(by: { hero1, hero2 in
                hero1.baseMaxAttack > hero2.baseMaxAttack
            })
        case "agi":
            tempHeroList.sort(by: { hero1, hero2 in
                hero1.moveSpeed > hero2.moveSpeed
            })
        case "int":
            tempHeroList.sort(by: { hero1, hero2 in
                hero1.baseMana > hero2.baseMana
            })
        default:
            break
        }
        
        return [tempHeroList[0], tempHeroList[1], tempHeroList[2]]
    }
    
    func getHeroList(completion: @escaping (_ error: Error?) -> Void) {
        let getHeroListRequest = GetHeroListRequest()
        let restRequest = RESTRequest()
        restRequest.execute(request: getHeroListRequest,
                            success: { response in
                                let jsonResponse = JSON(response)
                                if let jsonHeroList = jsonResponse.array {
                                    self.parseGetHeroList(jsonList: jsonHeroList)
                                    completion(nil)
                                } else {
                                    completion(NSError.defaultError)
                                }
        },
                            failure: { error in
                                completion(error)
        })
    }
    
    func parseGetHeroList(jsonList: [JSON]) {
        var heroRoles = Array<String>()
        for heroJSON in jsonList {
            let hero = Hero(json: heroJSON)
            heroList.append(hero)
            heroRoles.append(contentsOf: hero.roles)
        }
                
        heroRoleList = Array(NSOrderedSet(array: heroRoles)) as! [String]
        heroRoleList.sort()
        heroList.sort(by: {
            $0.name.caseInsensitiveCompare($1.name) == .orderedAscending
        })
        filteredHeroList = heroList
    }
    
    func filterHeroList(with role: String) {
        filteredHeroList.removeAll()
        if role == "All Heroes" {
            filteredHeroList = heroList
        } else {
            for hero in heroList {
                if hero.roles.contains(role) {
                    filteredHeroList.append(hero)
                }
            }
        }
    }
}
