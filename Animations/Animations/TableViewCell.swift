//
//  TableViewCell.swift
//  Animations
//
//  Created by Nurlybek Mussin on 02.04.18.
//  Copyright © 2018 Nurlybek Mussin. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var hideBtn: UIButton!
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    lazy var x = cellView.center.x
    @IBAction func infoPressed(_ sender: UIButton) {
        if x != cellView.center.x {
            cellView.center.x = x
        }
        UIView.animate(withDuration: 0.3, animations: {
            UIView.transition(with: self.cellView, duration: 0, options: UIViewAnimationOptions.transitionFlipFromRight, animations: {
                self.cellView.alpha = 1
            })

        })
        
    }
        
    @IBAction func hidePressed(_ sender: UIButton) {
        UIView.animate(withDuration: 0.6, animations: {
            self.cellView.center.x += 300
            self.cellView.alpha = 0
        })

    }
    @IBOutlet weak var viewTitle: UILabel!
    @IBOutlet weak var viewSubtitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        hideBtn.layer.borderColor = UIColor.white.cgColor
        hideBtn.layer.borderWidth = 1
        hideBtn.layer.cornerRadius = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
