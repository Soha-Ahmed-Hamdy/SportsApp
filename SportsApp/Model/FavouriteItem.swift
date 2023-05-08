//
//  FavouriteItem.swift
//  SportsApp
//
//  Created by Soha Ahmed Hamdy on 06/05/2023.
//

import Foundation
import CoreData
import UIKit

class FavouriteItem{
    
    var context : NSManagedObjectContext?
    var entity : NSEntityDescription?
    static let coreDataObj = FavouriteItem()
    
    private init(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
        entity = NSEntityDescription.entity(forEntityName: "FavouriteTeam", in: context!)
    
    }
    
    func insertItem(favouriteName: String , favouriteId : Int , sportType : String){
        let newTeam = NSManagedObject(entity: entity!, insertInto: context)
        newTeam.setValue(favouriteName, forKey: "favName")
        newTeam.setValue(favouriteId, forKey: "favId")
        newTeam.setValue(sportType, forKey: "sportType")
        
        do{
            try context?.save()
            print("saved")
        }catch{
            print("error")
        }
        
    }
    
    func fetchFavItem() -> [NSManagedObject]{
        var favouriteList : [NSManagedObject]?
        favouriteList = []
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "FavouriteTeam")
        request.returnsObjectsAsFaults = false
        do{
            let result = try context?.fetch(request)
            for data in result as! [NSManagedObject]{
                favouriteList?.append(data)
                print(data.value(forKey: "favName") as! String)
            }
        }catch{
            print("failed")
        }
        return favouriteList!
    }
    
    func deleteFav(itemFav : NSManagedObject){
        
        do{
            context?.delete(itemFav)
            try context?.save()
            
            
        }catch{
            print("failed")
        }
        
    }
    
    
    
}
