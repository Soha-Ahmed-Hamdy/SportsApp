//
//  ResultTableViewCell.swift
//  SportsApp
//
//  Created by Soha Ahmed Hamdy on 04/05/2023.
//

import UIKit

class ResultTableViewCell: UITableViewCell {

    
    
    
    @IBOutlet weak var score: UILabel!
    
    @IBOutlet weak var gameDate: UILabel!
    @IBOutlet weak var secTeam: UILabel!
    @IBOutlet weak var firstImg: UIImageView!
    @IBOutlet weak var firstTeam: UILabel!
    @IBOutlet weak var secImg: UIImageView!
    @IBOutlet weak var gameTime: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
