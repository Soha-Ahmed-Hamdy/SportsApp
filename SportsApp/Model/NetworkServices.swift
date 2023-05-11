//
//  NetworkServices.swift
//  SportsApp
//
//  Created by Soha Ahmed Hamdy on 04/05/2023.
//

import Foundation


protocol NetworkServicesProtocol {
    static func fetchResult(sport: String ,compilitionHandler : @escaping (Root?)-> Void)
    static func fetchResultEvents(sport: String , todayDate: String, weekStart: String, legKey:Int ,compilitionHandler : @escaping (Fixtures?)-> Void)
    static func fetchResultLivescore(sport: String , legKey:Int ,compilitionHandler : @escaping (Livescore?)-> Void)
    static func fetchResultPlayer(sport: String , playerId:Int ,compilitionHandler : @escaping (TennisPlayer?)-> Void)
    
    static func fetchResultTeams(sport: String , legKey:Int ,compilitionHandler : @escaping (Teams?)-> Void)
    static func fetchResultTeamFav(sport: String ,teamId:Int ,compilitionHandler : @escaping (Teams?)-> Void)


}


class NetworkServices : NetworkServicesProtocol{
    static func fetchResultTeamFav(sport: String, teamId: Int, compilitionHandler: @escaping (Teams?) -> Void) {
        let url = URL(string: "https://apiv2.allsportsapi.com/\(sport)/?met=Teams&teamId=\(teamId)&APIkey=74239ff4b0776dba5295debe45f7691ae79a6ed3ce907cacb868ab9107212fd4")
        guard let newUrl = url else {
            return
        }
        print("newUrlFav\(newUrl)")
        let request = URLRequest(url: newUrl)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request){ data ,response , error in
            do{
                print("dataFav\(String(describing: data))")
                let result = try JSONDecoder().decode(Teams.self, from: data ?? Data())
                print("resultFav\(result)")
                compilitionHandler(result)
                print("done in teams fav")


            }catch let error{
                print(error.localizedDescription)
                print("nil in teams fav")
                compilitionHandler(nil)
            }
            
        }
        task.resume()
    }
    
    
    
    static func fetchResultPlayer(sport: String, playerId: Int, compilitionHandler: @escaping (TennisPlayer?) -> Void) {
        let url = URL(string: "https://apiv2.allsportsapi.com/\(sport)/?met=Players&playerId=\(playerId)&APIkey=74239ff4b0776dba5295debe45f7691ae79a6ed3ce907cacb868ab9107212fd4")
        guard let newUrl = url else {
            return
        }
        print("newUrl\(newUrl)")
        let request = URLRequest(url: newUrl)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request){ data ,response , error in
            do{
                let result = try JSONDecoder().decode(TennisPlayer.self, from: data ?? Data())
                compilitionHandler(result)
                print(result.result?[0].playerName ?? "count of players is nil")
                print("done in player")


            }catch let error{
                print(error.localizedDescription)
                print("nil in player")
                compilitionHandler(nil)
            }
            
        }
        task.resume()
    }
    
    

    
    
    static func fetchResultTeams(sport: String, legKey: Int, compilitionHandler: @escaping (Teams?) -> Void) {
        let url = URL(string: "https://apiv2.allsportsapi.com/\(sport)/?met=Teams&APIkey=74239ff4b0776dba5295debe45f7691ae79a6ed3ce907cacb868ab9107212fd4&leagueId=\(legKey)")
        guard let newUrl = url else {
            return
        }
        print("newUrlTeams\(newUrl)")
        let request = URLRequest(url: newUrl)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request){ data ,response , error in
            do{
                let result = try JSONDecoder().decode(Teams.self, from: data ?? Data())
                compilitionHandler(result)
                print("done in teams")


            }catch let error{
                print(error.localizedDescription)
                print("nil in teams")
                compilitionHandler(nil)
            }
            
        }
        task.resume()
    }
    
    static func fetchResultLivescore(sport: String, legKey: Int, compilitionHandler: @escaping (Livescore?) -> Void) {
        let url = URL(string: "https://apiv2.allsportsapi.com/\(sport)/?met=Livescore&APIkey=74239ff4b0776dba5295debe45f7691ae79a6ed3ce907cacb868ab9107212fd4&leagueId=\(legKey)")
        guard let newUrl = url else {
            return
        }
        print("newUrl\(newUrl)")
        let request = URLRequest(url: newUrl)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request){ data ,response , error in
            do{
                let result = try JSONDecoder().decode(Livescore.self, from: data ?? Data())
                compilitionHandler(result)
                print("done in live")


            }catch let error{
                print(error.localizedDescription)
                print("nil in live")
                compilitionHandler(nil)
            }
            
        }
        task.resume()
    }
    
    static func fetchResultEvents(sport: String, todayDate: String, weekStart: String, legKey: Int, compilitionHandler: @escaping (Fixtures?) -> Void) {
        
        
        let url = URL(string: "https://apiv2.allsportsapi.com/\(sport)/?met=Fixtures&APIkey=74239ff4b0776dba5295debe45f7691ae79a6ed3ce907cacb868ab9107212fd4&from=\(todayDate)&to=\(weekStart)&leagueId=\(legKey)")
        guard let newUrl = url else {
            return
        }
        print("newUrl\(newUrl)")
        let request = URLRequest(url: newUrl)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request){ data ,response , error in
            do{
                let result = try JSONDecoder().decode(Fixtures.self, from: data ?? Data())
                compilitionHandler(result)
                print("done in event")


            }catch let error{
                print(error.localizedDescription)
                print("nil in event")
                compilitionHandler(nil)
            }
            
        }
        task.resume()
        
    }
    
    
    static func fetchResult(sport: String , compilitionHandler : @escaping (Root?)-> Void){
        let url = URL(string: "https://apiv2.allsportsapi.com/\(sport)/?met=Leagues&APIkey=74239ff4b0776dba5295debe45f7691ae79a6ed3ce907cacb868ab9107212fd4")
        guard let newUrl = url else {
            return
        }
        print(newUrl)
        let request = URLRequest(url: newUrl)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request){ data ,response , error in
            do{
                let result = try JSONDecoder().decode(Root.self, from: data ?? Data())
                compilitionHandler(result)
            }catch let error{
                print(error.localizedDescription)
                compilitionHandler(nil)
            }
            
        }
        task.resume()
        
    }
}

