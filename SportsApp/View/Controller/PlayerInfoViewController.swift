//
//  PlayerInfoViewController.swift
//  SportsApp
//
//  Created by Soha Ahmed Hamdy on 05/05/2023.
//

import UIKit

class PlayerInfoViewController: UIViewController {
    
    var player : Players?
    var sportType : String?
    var coreViewModel : CoreViewModel!

    
    @IBOutlet weak var playerAge: UILabel!
    @IBOutlet weak var playerCoun: UILabel!
    @IBOutlet weak var playerImage: UIImageView!
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var playerNum: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coreViewModel = CoreViewModel()
        
        playerAge.text = player?.playerAge ?? ""
        playerNum.text = player?.playerNumber ?? ""
        playerCoun.text = player?.playerCountry ?? ""
        playerName.text = player?.playerName ?? ""
        
        
        var leagueImage : String = ""
        if (player?.playerImage) != nil{
            leagueImage = (player?.playerImage)!
        }else{
            leagueImage = ""
        }
        playerImage.sd_setImage(with: URL(string: leagueImage), placeholderImage: UIImage(named: "1"))
        playerImage.layer.cornerRadius = 50.0
        playerImage.layer.borderColor = UIColor.gray.cgColor
        playerImage.layer.borderWidth = 2
        playerImage.clipsToBounds = true

    }
    
    @IBAction func favButton(_ sender: Any) {
      
        if (player?.playerKey) != nil{
            let confirmAction = UIAlertAction(title: "Save", style: .default){ action in
                self.saveFavPlayer()
            }
            MakeAlert.displayAlert(title: "Saving!!", message: "Do you want to add this palyer to favourite?", action: confirmAction, controller: self)
        }
    }
    
    
    func saveFavPlayer(){
        let name = player?.playerName
        coreViewModel.insertIntoCore(favName: name ?? "", favId: (player?.playerKey)!, sportType: sportType!)
        coreViewModel.getCore()
        
    }
   

}
