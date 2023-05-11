//
//  DetailsViewController.swift
//  SportsApp
//
//  Created by Soha Ahmed Hamdy on 04/05/2023.
//

import UIKit
import CoreData

class DetailsViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate{
    var team : TeamsResult?
    var placeHolderD : String?
    var sportType : String?
    var coreViewModel : CoreViewModel!
    var favObjects : [NSManagedObject]? = []
    
    
    @IBOutlet weak var favButtons: UIButton!
    
    
    @IBOutlet weak var nameDPlay: UILabel!
    @IBOutlet weak var imageDetails: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return team?.players?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailsCell", for: indexPath) as! DetailsTableViewCell
        
        
        // cell radius
        cell.viewBack.layer.cornerRadius = 40.0
        cell.clipsToBounds = true
        cell.imageDCell?.layer.cornerRadius = 35.0
        cell.imageDCell?.contentMode = .scaleAspectFill
        cell.imageDCell?.clipsToBounds = true
        cell.viewBack.clipsToBounds = true


        //assign values to cell
        var unwrappedImage : String = ""
        if (team?.players?[indexPath.row]?.playerImage) != nil{
            unwrappedImage = (team?.players?[indexPath.row]?.playerImage)!
        }else{
            unwrappedImage = ""
        }
        
        cell.imageDCell.sd_setImage(with: URL(string: unwrappedImage), placeholderImage: UIImage(named: placeHolderD!))
        cell.labelDName?.text = team?.players?[indexPath.row]?.playerName
        cell.labelDNum?.text = team?.players?[indexPath.row]?.playerNumber

        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = view.backgroundColor
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 12
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let playerVC = self.storyboard?.instantiateViewController(withIdentifier: "PlayerInfoViewController") as! PlayerInfoViewController
        playerVC.player = team?.players![indexPath.row]
        playerVC.sportType = sportType
        self.navigationController?.pushViewController(playerVC, animated: true)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        if (coreViewModel.checkIfInserted(favId: (team?.team_key)!)){
            favButtons.tintColor = UIColor.red
        }else{
            favButtons.tintColor = UIColor(named: "bgColor")
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coreViewModel = CoreViewModel()
        self.title = "Team Details"
    
        //set Values
        var unwrappedImage : String = ""
        if (team?.team_logo) != nil{
            unwrappedImage = (team?.team_logo)!
        }else{
            unwrappedImage = ""
        }
                
        imageDetails.sd_setImage(with: URL(string: unwrappedImage), placeholderImage: UIImage(named: placeHolderD!))
        nameDPlay.text = team?.team_name
        tableView.reloadData()
        
        //radius for image
        imageDetails.layer.cornerRadius = 50.0
        imageDetails.contentMode = .scaleAspectFill
        imageDetails.clipsToBounds = true
        
    }
    
    
    

    @IBAction func favButton(_ sender: Any) {
        
        if (coreViewModel.checkIfInserted(favId: (team?.team_key)!)){
            let confirmAction = UIAlertAction(title: "Delete", style: .default){ action in
                self.deleteItemFromCore()
            }
            MakeAlert.displayAlert(title: "Warning!!", message: "Do you want to delete this Team?", action: confirmAction, controller: self)
            
        }else{
            
            let confirmAction = UIAlertAction(title: "Save", style: .default){ action in
                self.insertItemToFavourites()
            }
            MakeAlert.displayAlert(title: "Saving!!", message: "Do you want to save this Team to favourite?", action: confirmAction, controller: self)
        }
    }
    
    
    
    
    func insertItemToFavourites(){
        
        let name = team?.team_name
        coreViewModel.insertIntoCore(favName: name ?? "", favId: (team?.team_key)!, sportType: sportType!)
        coreViewModel.getCore()
        favButtons.tintColor = UIColor.red
    }
    
    func deleteItemFromCore(){
        let teamId = self.team?.team_key
        favObjects = FavouriteItem.coreDataObj.fetchFavItem()
        favObjects?.forEach{ data in
            let favouriteId = data.value(forKey: "favId") as! Int
            if favouriteId == teamId{
                self.coreViewModel.deleteFromCore(favItem: data)
                favButtons.tintColor = UIColor(named: "bgColor")
            }
        }
        
    }
    
    
    
    
}
