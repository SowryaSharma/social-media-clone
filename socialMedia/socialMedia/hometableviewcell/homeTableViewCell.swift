//
//  homeTableViewCell.swift
//  socialMedia
//
//  Created by Cumulations Technologies on 11/03/22.
//

import UIKit

class homeTableViewCell: UITableViewCell {
    var identifier = "homeTableViewCell"
    @IBOutlet weak var profileImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        profileImage.layer.borderWidth = 1.0
        profileImage.layer.masksToBounds = false
        profileImage.layer.borderColor = UIColor.white.cgColor
        profileImage.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
