//
//  DetailsViewController.swift
//  SportsApp
//
//  Created by Soha Ahmed Hamdy on 04/05/2023.
//

import UIKit

class DetailsViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate{
    var team : TeamsResult?
    var placeHolderD : String?
    var sportType : String?
    var coreViewModel : CoreViewModel!
    
    
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
        
        //table seprator
        cell.layer.borderColor = UIColor.white.cgColor
        cell.layer.borderWidth = 8

        // cell radius
        cell.layer.cornerRadius = 50.0
        cell.clipsToBounds = true
        cell.imageDCell?.layer.cornerRadius = 45.0
        cell.imageDCell?.contentMode = .scaleAspectFill
        cell.imageDCell?.clipsToBounds = true

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
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let playerVC = self.storyboard?.instantiateViewController(withIdentifier: "PlayerInfoViewController") as! PlayerInfoViewController
        playerVC.player = team?.players![indexPath.row]
        playerVC.sportType = sportType
        self.navigationController?.pushViewController(playerVC, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coreViewModel = CoreViewModel()
    
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
        
        let confirmAction = UIAlertAction(title: "Save", style: .default){ action in
            self.insertItemToFavourites()
        }
        MakeAlert.displayAlert(title: "Saving!!", message: "Do you want to save this Team to favourite?", action: confirmAction, controller: self)
    }
    
    
    func insertItemToFavourites(){
        
        let name = team?.team_name
        coreViewModel.insertIntoCore(favName: name ?? "", favId: (team?.team_key)!, sportType: sportType!)
        coreViewModel.getCore()
    }
    
}
