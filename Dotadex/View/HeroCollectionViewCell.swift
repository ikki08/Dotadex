//
//  HeroCollectionViewCell.swift
//  Dotadex
//
//  Created by Rizki Dwi Putra on 16/04/20.
//  Copyright © 2020 Rizki Dwi Putra. All rights reserved.
//

import UIKit
import SDWebImage

class HeroCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    func setupCell(hero: Hero) {
        nameLabel.text = hero.name
        let imageCache = NSCache<NSString, UIImage>()
        if let cachedImage = imageCache.object(forKey: hero.imageURL as NSString) {
            image.image = cachedImage
        } else {
            image.sd_setImage(with: URL(string: hero.imageURL),
                              placeholderImage: UIImage(named: "temp_hero_image"),
                              completed: { (image, _, _, _) -> Void in
                guard let heroImage = image else { return }
                
                imageCache.setObject(heroImage, forKey: hero.imageURL as NSString)
            })
        }
    }
}
