//
//  StoryCollectionViewCell.swift
//  InstagramApp
//
//  Created by Peter Orisadipe on 18/05/2019.
//  Copyright © 2019 Gwinyai Nyatsoka. All rights reserved.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var storyImage: UIImageView!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        storyImage.layer.cornerRadius = storyImage.frame.width / 2
        
        storyImage.layer.masksToBounds = true
        
        storyImage.layer.borderColor = UIColor.white.cgColor
        
        storyImage.layer.borderWidth = CGFloat(3.0)
    }

}
