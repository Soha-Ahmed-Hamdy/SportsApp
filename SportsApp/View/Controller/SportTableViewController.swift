//
//  SportTableViewController.swift
//  SportsApp
//
//  Created by Soha Ahmed Hamdy on 02/05/2023.
//

import UIKit
import SDWebImage

class SportTableViewController: UITableViewController {
    var sportsList: Root?
    var sportType: String?
    var placeHolderImg : String?
    var viewModel: ViewModel!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = ViewModel()
        viewModel.getRoot(sportType: sportType!)
        viewModel.bindResultToViewController = {() in self.renderView()}
        
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let eventVC = self.storyboard?.instantiateViewController(withIdentifier: "EventViewController") as! EventViewController
        eventVC.sportType = sportType
        eventVC.placeHolderImg = checkSportTypeToAssignPlaceHolder()
        eventVC.leagId = sportsList?.result[indexPath.row].leagueKey
        self.navigationController?.pushViewController(eventVC, animated: true)

    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sportsList?.result.count ?? 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sportCell", for: indexPath) as! SportsTableViewCell
        
        handleCellSize(cell: cell)
        
        //assign data
        cell.labelCell.text = sportsList?.result[indexPath.row].leagueName
        var leagueImage : String = ""
        if (sportsList?.result[indexPath.row].leagueLogo) != nil{
            leagueImage = (sportsList?.result[indexPath.row].leagueLogo)!
        }else{
            leagueImage = ""
        }
        cell.imageCell.sd_setImage(with: URL(string: leagueImage), placeholderImage: UIImage(named: placeHolderImg!))
        
        
        return cell
    }
    
    
    func checkSportTypeToAssignPlaceHolder()-> String{
        if sportType == "football"{
            return "foot"
                            
        }else if sportType == "basketball"{
            return "basket"


        }else if sportType == "cricket"{
            return "cri"

            
        }else{
            return "tennis"
 
        }
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = view.backgroundColor
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 12
    }
    
    
    func handleCellSize(cell: SportsTableViewCell){
        //table seprator
        //cell.layer.borderColor = UIColor(named: "bgColor")?.cgColor
        //cell.layer.borderWidth = 8
        
  
        // cell radius
        cell.viewBack.layer.cornerRadius = 50.0
        cell.clipsToBounds = true
        cell.imageCell.layer.cornerRadius = 45.0
        cell.imageCell.contentMode = .scaleAspectFill
        cell.imageCell.layer.borderWidth = 2
        cell.imageCell.layer.borderColor = UIColor(named: "bgColor")?.cgColor
        cell.imageCell.clipsToBounds = true
        cell.viewBack.clipsToBounds = true
    }
    
    func renderView(){
        DispatchQueue.main.async {
            self.sportsList = self.viewModel.VWResult
            self.title = "Leagues"
            self.tableView.reloadData()
            print("success")

        }
    }
    
    

}
