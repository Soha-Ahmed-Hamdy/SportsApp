//
//  PlayerInfoViewController.swift
//  SportsApp
//
//  Created by Soha Ahmed Hamdy on 05/05/2023.
//

import UIKit
import CoreData

class PlayerInfoViewController: UIViewController {
    
    var player : Players?
    var sportType : String?
    var coreViewModel : CoreViewModel!
    var favObjects : [NSManagedObject]? = []

    @IBOutlet weak var favButtons: UIButton!
    @IBOutlet weak var playerAge: UILabel!
    @IBOutlet weak var playerCoun: UILabel!
    @IBOutlet weak var playerImage: UIImageView!
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var playerNum: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coreViewModel = CoreViewModel()
        
        playerAge.text = player?.playerAge ?? "No Data"
        playerNum.text = player?.playerNumber ?? "No Data"
        playerCoun.text = player?.playerCountry ?? "No Data"
        playerName.text = player?.playerName ?? "No Data"
        
        
        var leagueImage : String = ""
        if (player?.playerImage) != nil{
            leagueImage = (player?.playerImage)!
        }else{
            leagueImage = ""
        }
        playerImage.sd_setImage(with: URL(string: leagueImage), placeholderImage: UIImage(named: "foot"))
        playerImage.layer.cornerRadius = 50.0
        playerImage.layer.borderColor = UIColor.gray.cgColor
        playerImage.layer.borderWidth = 2
        playerImage.clipsToBounds = true

    }
    
    override func viewWillAppear(_ animated: Bool) {
        if (coreViewModel.checkIfInserted(favId: (player?.playerKey)!)){
            favButtons.tintColor = UIColor.red
        }else{
            favButtons.tintColor = UIColor(named: "bgColor")
        }
    }
    
    
    @IBAction func favButton(_ sender: Any) {
        
        if (coreViewModel.checkIfInserted(favId: (player?.playerKey)!)){
            
//            let confirmAction = UIAlertAction(title: "OK", style: .default)
//            MakeAlert.displayAlert(title: "Saving!!", message: "This player is already in favourites", action: confirmAction, controller: self)
            
            let confirmAction = UIAlertAction(title: "Delete", style: .default){ action in
                self.deleteItemFromCore()
            }
            MakeAlert.displayAlert(title: "Warning!!", message: "Do you want to delete this Team?", action: confirmAction, controller: self)
            
        }else{
            
            if sportType == "football"{
                
                let confirmAction = UIAlertAction(title: "OK", style: .default)
                MakeAlert.displayAlert(title: "Warning!!", message: "Can't save football player", action: confirmAction, controller: self)
                
            }else{
                
                if (player?.playerKey) != nil{
                    let confirmAction = UIAlertAction(title: "Save", style: .default){ action in
                        self.saveFavPlayer()
                    }
                    MakeAlert.displayAlert(title: "Saving!!", message: "Do you want to add this palyer to favourite?", action: confirmAction, controller: self)
                }
            }
        }
    }
    
    
    
    func saveFavPlayer(){
        let name = player?.playerName
        coreViewModel.insertIntoCore(favName: name ?? "", favId: (player?.playerKey)!, sportType: sportType!)
        coreViewModel.getCore()
        favButtons.tintColor = UIColor.red
    }
    
    
    func deleteItemFromCore(){
        let playerId = self.player?.playerKey
        favObjects = FavouriteItem.coreDataObj.fetchFavItem()
        favObjects?.forEach{ data in
            let favouriteId = data.value(forKey: "favId") as! Int
            if favouriteId == playerId{
                self.coreViewModel.deleteFromCore(favItem: data)
                favButtons.tintColor = UIColor(named: "bgColor")
            }
        }
    }
    
    
   

}
