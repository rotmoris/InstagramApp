//
//  ActivityTableViewCell.swift
//  InstagramApp
//
//  Created by Peter Orisadipe on 02/06/2019.
//  Copyright © 2019 Gwinyai Nyatsoka. All rights reserved.
//

import UIKit

class ActivityTableViewCell: UITableViewCell {
    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var detailsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        profileImage.layer.masksToBounds = true
        
        self.selectionStyle = UITableViewCell.SelectionStyle.none
        
    }

    override func layoutSubviews() {
        
        profileImage.layer.cornerRadius = profileImage.frame.width / 2
        
    }
    
}
