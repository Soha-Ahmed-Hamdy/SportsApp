//
//  CoreViewModel.swift
//  SportsApp
//
//  Created by Soha Ahmed Hamdy on 07/05/2023.
//

import Foundation
import CoreData

class CoreViewModel{
    
    var bindResultToViewControllerGet : (()->()) = {}
    
    
    var VMResultGet : [NSManagedObject] = []{
        didSet{
            bindResultToViewControllerGet()
        }
    }
    
    
    
    func getCore(){
        self.VMResultGet = FavouriteItem.coreDataObj.fetchFavItem()
    }
    
    func insertIntoCore(favName: String , favId: Int , sportType: String){
        FavouriteItem.coreDataObj.insertItem(favouriteName: favName, favouriteId: favId, sportType: sportType)
    }
    
    func deleteFromCore(favItem: NSManagedObject){
        FavouriteItem.coreDataObj.deleteFav(itemFav: favItem)
    }
    
    func checkIfInserted(favId : Int )-> Bool{
        var result = false
        var favourites : [NSManagedObject]?
        favourites = FavouriteItem.coreDataObj.fetchFavItem()
        favourites?.forEach{ data in
            let favouriteId = data.value(forKey: "favId") as! Int
            if favouriteId == favId{
                result = true
            }
        }
        return result
    }
    
    
    
}
