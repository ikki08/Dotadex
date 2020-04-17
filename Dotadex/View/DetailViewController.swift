//
//  DetailViewController.swift
//  Dotadex
//
//  Created by Rizki Dwi Putra on 17/04/20.
//  Copyright © 2020 Rizki Dwi Putra. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var heroNameLabel: UILabel!
    @IBOutlet weak var heroImage: UIImageView!    
    @IBOutlet weak var attackTypeLabel: UILabel!
    @IBOutlet weak var rolesLabel: UILabel!
    @IBOutlet weak var strLabel: UILabel!
    @IBOutlet weak var agiLabel: UILabel!
    @IBOutlet weak var intLabel: UILabel!
    @IBOutlet weak var attackLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var healthLabel: UILabel!
    @IBOutlet weak var firstSimilarHeroImage: UIImageView!
    @IBOutlet weak var secondSimilarHeroImage: UIImageView!
    @IBOutlet weak var thirdSimilarHeroImage: UIImageView!
    
    var hero: Hero!
    var similarHeroes: [Hero]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    func setUI() {
        heroNameLabel.text = hero.name
        heroImage.setImage(urlString: hero.imageURL)
        attackTypeLabel.text = hero.attackType
        rolesLabel.text = hero.roles.joined(separator: " - ")
        strLabel.text = String(hero.baseStr)
        agiLabel.text = String(hero.baseAgi)
        intLabel.text = String(hero.baseInt)
        attackLabel.text = String(hero.baseMinAttack) + " - " + String(hero.baseMaxAttack)
        speedLabel.text = String(hero.moveSpeed)
        healthLabel.text = String(hero.baseHealth)        
        firstSimilarHeroImage.setImage(urlString: similarHeroes[0].imageURL)
        secondSimilarHeroImage.setImage(urlString: similarHeroes[1].imageURL)
        thirdSimilarHeroImage.setImage(urlString: similarHeroes[2].imageURL)
    }
}
