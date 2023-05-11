//
//  SportsTableViewCell.swift
//  SportsApp
//
//  Created by Soha Ahmed Hamdy on 02/05/2023.
//

import UIKit

class SportsTableViewCell: UITableViewCell {

    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var labelCell: UILabel!
    
    @IBOutlet weak var viewBack: GradientView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
