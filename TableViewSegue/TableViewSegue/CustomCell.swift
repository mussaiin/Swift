//
//  CustomCell.swift
//  TableViewSegue
//
//  Created by Darkhan on 29.01.18.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var fruit_imageView: UIImageView!
    
    @IBOutlet weak var fruit_label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
