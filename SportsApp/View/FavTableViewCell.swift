//
//  FavTableViewCell.swift
//  SportsApp
//
//  Created by Soha Ahmed Hamdy on 05/05/2023.
//

import UIKit

class FavTableViewCell: UITableViewCell {

    
    @IBOutlet weak var favItemName: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
