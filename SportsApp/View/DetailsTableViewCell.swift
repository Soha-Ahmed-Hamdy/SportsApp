//
//  DetailsTableViewCell.swift
//  SportsApp
//
//  Created by Soha Ahmed Hamdy on 04/05/2023.
//

import UIKit

class DetailsTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var viewBack: GradientView!
    @IBOutlet weak var labelDNum: UILabel!
    @IBOutlet weak var labelDName: UILabel!
    @IBOutlet weak var imageDCell: UIImageView!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
