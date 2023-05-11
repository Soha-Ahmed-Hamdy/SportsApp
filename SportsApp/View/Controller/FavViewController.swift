//
//  FavViewController.swift
//  SportsApp
//
//  Created by Soha Ahmed Hamdy on 05/05/2023.
//

import UIKit
import CoreData
import SystemConfiguration

class FavViewController: UIViewController , UITableViewDataSource,UITableViewDelegate{
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var noFav: UILabel!
    var favItems : [String]?
    var tableData : [FavouriteItem]?
    var context: NSManagedObjectContext?
    var favObjects : [NSManagedObject]? = []
    var viewModel : ViewModel!
    var coreViewModel: CoreViewModel!
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (favObjects?.count) ?? 0
    }
    
    //assign values to each cell
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favCell", for: indexPath) as! FavTableViewCell
            
        //assign values
        cell.favItemName.text = (favObjects?[indexPath.row].value(forKey: "favName") as! String)
        print(favObjects?[indexPath.row].value(forKey: "favName") as! String)
            
        
        // cell radius
        cell.viewBack.layer.cornerRadius = 40.0
        cell.viewBack.clipsToBounds = true
        
        
        
        return cell
    }
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if(isConnectedToNetwork()){
            if (favObjects?[indexPath.row].value(forKey: "sportType")) as! String == "tennis"{
                
                viewModel.getPlayer(sportType: (self.favObjects?[indexPath.row].value(forKey: "sportType"))! as! String, playerId: favObjects?[indexPath.row].value(forKey: "favId") as! Int)
                viewModel.bindResultToViewControllerPlayer = {() in self.renderView(index: indexPath.row)}

            }else if (favObjects?[indexPath.row].value(forKey: "sportType")) as! String == "football"{
                
                viewModel.getTeamfav(sportType: (self.favObjects?[indexPath.row].value(forKey: "sportType"))! as! String, teamId: favObjects?[indexPath.row].value(forKey: "favId") as! Int)
                viewModel.bindResultToViewControllerTeamFav = {() in self.renderView(index: indexPath.row)}
                
            }
            
        }else{
            
            let confirmAction = UIAlertAction(title: "OK", style: .default)
            MakeAlert.displayAlert(title: "Warning!!", message: "Check Network connection.. ", action: confirmAction, controller: self)
            
        }
        
        
    }
    
    
    //deleting item from table
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        let confirmAction = UIAlertAction(title: "Delete", style: .default){ action in
            self.deleteCoreItem(index: indexPath.row)
        }
        MakeAlert.displayAlert(title: "Warning!!", message: "You are about to delete item .. ", action: confirmAction, controller: self)
    }
    
    
    //specifiying cell size
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let width = UIScreen.main.bounds.width
        let height = 100
        return CGFloat( signOf: width , magnitudeOf: CGFloat(height))

    }
    
    override func viewWillAppear(_ animated: Bool) {

        favObjects = FavouriteItem.coreDataObj.fetchFavItem()
        tableView.reloadData()
        if (favObjects?.count == 0){
            noFav.text = "No Favourites yet"
            print("fav nil")
        }else{
            noFav.text = ""
        }
    }
    
    //deleting item from core data
    
    func deleteCoreItem(index : Int){
        
        coreViewModel.deleteFromCore(favItem: favObjects![index])
        coreViewModel.getCore()
        coreViewModel.bindResultToViewControllerGet = {() in self.renderView()}
        
        if (favObjects?.count == 0){
            noFav.text = "No Favourites yet"
            print("fav nil")
        }else{
            noFav.text = ""
        }
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Favourites"
        viewModel = ViewModel()
        coreViewModel = CoreViewModel()
        coreViewModel.getCore()
        coreViewModel.bindResultToViewControllerGet = {() in self.renderView()}
        
    }
    
    
    
    func renderView(index: Int){
        
        DispatchQueue.main.async { [self] in
            if (favObjects?[index].value(forKey: "sportType")) as! String == "tennis"{

                let playerVC = self.storyboard?.instantiateViewController(withIdentifier: "PlayerInfoViewController") as! PlayerInfoViewController
                playerVC.player = self.viewModel.VWResultPlayer?.result?[0]
                playerVC.sportType = self.favObjects?[index].value(forKey: "sportType") as? String
                self.navigationController?.pushViewController(playerVC, animated: true)
                    
                
            }else if (favObjects?[index].value(forKey: "sportType")) as! String == "football"{
                
                let detailsVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
                detailsVC.team = self.viewModel.VWResultTeamFav?.result![0]
                detailsVC.sportType = "football"
                detailsVC.placeHolderD = "foot"
                self.navigationController?.pushViewController(detailsVC, animated: true)
                    
            }
        }
    }
    
    
    
    func renderView(){
        favObjects = coreViewModel.VMResultGet
        self.tableView.reloadData()
    }
    
    func isConnectedToNetwork() -> Bool {
            var zeroAddress = sockaddr_in()
            zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
            zeroAddress.sin_family = sa_family_t(AF_INET)
            guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
                $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                    SCNetworkReachabilityCreateWithAddress(nil, $0)
                }
            }) else {
                return false
            }
            var flags: SCNetworkReachabilityFlags = []
            if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
                return false
            }
            let isReachable = flags.contains(.reachable)
            let needsConnection = flags.contains(.connectionRequired)
            return (isReachable && !needsConnection)
        }


    
    
    
}
