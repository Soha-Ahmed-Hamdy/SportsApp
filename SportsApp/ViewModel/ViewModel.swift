//
//  ViewModel.swift
//  SportsApp
//
//  Created by Soha Ahmed Hamdy on 07/05/2023.
//

import Foundation

class ViewModel{
    
    var bindResultToViewController : (()->()) = {}
    var bindResultToViewControllerEvent : (()->()) = {}
    var bindResultToViewControllerLatest : (()->()) = {}
    var bindResultToViewControllerTeam : (()->()) = {}
    var bindResultToViewControllerTeamFav : (()->()) = {}
    var bindResultToViewControllerPlayer : (()->()) = {}
    
    var VWResult : Root?{
        didSet{
            bindResultToViewController()
        }
    }
    
    var VWResultEvent : Fixtures?{
        didSet{
            bindResultToViewControllerEvent()
        }
    }
    var VWResultLiveScore : Livescore?{
        didSet{
            bindResultToViewControllerLatest()
        }
    }
    var VWResultTeam : Teams?{
        didSet{
            bindResultToViewControllerTeam()
        }
    }
    var VWResultPlayer : TennisPlayer?{
        didSet{
            bindResultToViewControllerPlayer()
        }
    }
    var VWResultTeamFav : Teams?{
        didSet{
            bindResultToViewControllerTeamFav()
        }
    }
    
    
    
    func getRoot(sportType: String){
        NetworkServices.fetchResult(sport: sportType){ res in
            guard let result = res else { return }
            self.VWResult = result
            
        }
    }
    
    func getEvents(sportType: String, todayDate: String, weekStart: String, legKey: Int){
        NetworkServices.fetchResultEvents(sport: sportType, todayDate: todayDate, weekStart: weekStart, legKey: legKey){ res in
            guard let result = res else { return }
            self.VWResultEvent = result
            
        }
    }
    
    func getLivescore(sportType: String , legKey : Int){
        NetworkServices.fetchResultLivescore(sport: sportType, legKey: legKey){ res in
            guard let result = res else { return }
            self.VWResultLiveScore = result
            
        }
    }
    
    func getTeam(sportType: String , legKey : Int){
        NetworkServices.fetchResultTeams(sport: sportType, legKey: legKey){ res in
            guard let result = res else { return }
            self.VWResultTeam = result
            
        }
    }
    
    func getPlayer(sportType: String, playerId: Int){
        NetworkServices.fetchResultPlayer(sport: sportType, playerId: playerId){ res in
            guard let result = res else { return }
            self.VWResultPlayer = result
            
        }
    }
    
    func getTeamfav(sportType: String , teamId: Int){
        NetworkServices.fetchResultTeamFav(sport: sportType, teamId: teamId){ res in
            guard let result = res else { return }
            self.VWResultTeamFav = result
            
        }
    }
    
    
    
    
    
}

