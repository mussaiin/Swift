//
//  SocNetTableViewCell.swift
//  SDUapp
//
//  Created by Nurlybek Mussin on 07.03.18.
//  Copyright © 2018 Nurlybek Mussin. All rights reserved.
//

import UIKit

class ClubsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var clubImage: UIImageView!
    @IBOutlet weak var clubName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

