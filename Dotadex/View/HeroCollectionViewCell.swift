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
        image.setImage(urlString: hero.imageURL)
    }
}
