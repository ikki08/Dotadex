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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    func setUI() {
        heroNameLabel.text = hero.name
        let imageCache = NSCache<NSString, UIImage>()
        if let cachedImage = imageCache.object(forKey: hero.imageURL as NSString) {
            heroImage.image = cachedImage
        } else {
            heroImage.sd_setImage(with: URL(string: hero.imageURL),
                                  placeholderImage: UIImage(named: "temp_hero_image"),
                                  completed: { [weak self] (image, _, _, _) -> Void in
                                    guard let `self` = self, let heroImage = image else { return }
                                    imageCache.setObject(heroImage, forKey: self.hero.imageURL as NSString)
            })
        }
        
        attackTypeLabel.text = hero.attackType
        rolesLabel.text = hero.roles.joined(separator: " - ")
        strLabel.text = String(hero.baseStr)
        agiLabel.text = String(hero.baseAgi)
        intLabel.text = String(hero.baseInt)
        attackLabel.text = String(hero.baseMinAttack) + " - " + String(hero.baseMaxAttack)
        speedLabel.text = String(hero.moveSpeed)
        healthLabel.text = String(hero.baseHealth)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
