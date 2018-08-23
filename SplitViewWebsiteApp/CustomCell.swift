//
//  CustomCell.swift
//  SplitViewWebsiteApp
//
//  Created by Nurlybek Mussin on 21.02.18.
//  Copyright © 2018 Nurlybek Mussin. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var siteLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
