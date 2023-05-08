//
//  MainScreenViewController.swift
//  SportsApp
//
//  Created by Soha Ahmed Hamdy on 02/05/2035.
//

import UIKit
//import Reachability
import SystemConfiguration


//https://apiv2.allsportsapi.com/football/?met=Leagues&APIkey=74239ff4b0776dba5295debe45f7691ae79a6ed3ce907cacb868ab9107212fd4


private let reuseIdentifier = "item"

class MainScreenViewController: UICollectionViewController , UICollectionViewDelegateFlowLayout{
    
    let images = ["foot","basket","c","tennis"]
    let sportName = ["Football","Basketball","Cricket","Tennis"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if(isConnectedToNetwork()){
        
        let sportVC = self.storyboard?.instantiateViewController(withIdentifier: "SportTableViewController") as! SportTableViewController
        sportVC.sportType = specifiySportType(index: indexPath.row)
        sportVC.placeHolderImg = specifiyPlaceHolder(index: indexPath.row)
        self.navigationController?.pushViewController(sportVC, animated: true)

        } else{
            let confirmAction = UIAlertAction(title: "OK", style: .default)
            MakeAlert.displayAlert(title: "Warning!!", message: "Check Network connection.. ", action: confirmAction, controller: self)
       }
    }
    

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "item", for: indexPath) as! CollectionViewCell
        handleCellSize(cell: cell)
        cell.sportLabel.text = sportName[indexPath.row]
        cell.imgV.image = UIImage(named: images[indexPath.row])
    
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height / 3
        
        return CGSize(width: width / 2, height: height)
    }
    
    
    func specifiySportType(index: Int)-> String{
        if index == 0{
            return "football"
             
        }else if index == 1{
            return "basketball"

        }else if index == 2{
            return "cricket"
            
        }else{
            return "tennis"
            
        }
    }
    
    
    func specifiyPlaceHolder(index: Int)-> String{
        if index == 0{
            return "foot"
             
        }else if index == 1{
            return "basket"

        }else if index == 2{
            return "cri"
            
        }else{
            return "tennis"
            
        }
    }
    
    func handleCellSize(cell :CollectionViewCell){
        // Configure the cell
        cell.layer.cornerRadius = 70.0
        cell.clipsToBounds = true
        cell.imgV.layer.cornerRadius = 50.0
        cell.imgV.contentMode = .scaleAspectFill
        cell.imgV.clipsToBounds = true
        
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


//    func isConnectedToInternet() ->Bool{
//       let reachability = try! Reachability()
//        switch reachability.connection{
//        case .wifi, .cellular:
//            return true
//        case .none :
//            return false
//        case .unavailable:
//            return false
//        }
//    }


}
