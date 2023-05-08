//
//  SportItem.swift
//  SportsApp
//
//  Created by Soha Ahmed Hamdy on 04/05/2023.
//

import Foundation

//struct Root: Decodable {
//    let success: Int
//    let result: [Item]
//}
//
//struct Item: Decodable {
//    let league_key: Int
//    let league_name: String
//    let country_key: Int
//    let country_name: String
//    let league_logo: String
//    let country_logo: String
//}

// MARK: - Welcome
struct Root: Codable {
    let success: Int
    let result: [Item]
}

class Fixtures : Codable {
    
    var success : Int?
    var result : [matchs]?
    
}

class matchs : Codable{
    var event_date : String?
    var event_time : String?
    var event_away_team : String?
    var event_home_team : String?
    var event_final_result :String?
    var league_name : String?
    var league_round : String?
    var league_logo : String?
    var home_team_logo : String?
    var away_team_logo : String?
    var event_home_team_logo:String?
    var event_away_team_logo:String?
    var league_season : String?
    var event_live : String?
    var event_stadium : String?
    var event_date_start:String?  // creccit
    var event_home_final_result:String? // creccit
    var event_away_final_result:String? // creccit
    var event_first_player: String? // tennis
    var event_second_player: String? // tennis
    var first_player_key: Int? //tennis
    var second_player_key: Int? //tennis
    var player:String?
    var event_first_player_logo:String?
    var event_second_player_logo:String?
    var event_serve: String?//tennis
    var event_winner: String? //tennis
    
}

struct Item: Codable {
    let leagueKey: Int?
    let leagueName: String?
    let countryKey: Int?
    let countryName: String?
    let leagueLogo, countryLogo, leagueYear: String?

    enum CodingKeys: String, CodingKey {
        case leagueKey = "league_key"
        case leagueName = "league_name"
        case countryKey = "country_key"
        case countryName = "country_name"
        case leagueLogo = "league_logo"
        case countryLogo = "country_logo"
        case leagueYear = "league_year"
        
    }
    
}

struct Livescore: Codable {
    let success: Int
    let result: [LivescoreResult]?
}

struct LivescoreResult: Codable {
    let event_key: Int?
    let event_date: String
    let event_time: String
    let event_home_team: String?
    let home_team_key: Int?
    let event_away_team: String?
    let away_team_key: Int?
    let event_halftime_result: String?
    let event_final_result: String?
    let event_ft_result: String?
    let event_penalty_result: String?
    let event_status: String?
    let country_name: String?
    let league_name: String?
    let league_key: Int?
    let league_round: String?
    let league_season: String?
    let event_live: String?
    let event_stadium: String?
    let event_referee: String?
    let home_team_logo: String?
    let away_team_logo: String?
    let event_country_key: Int?
    let league_logo: String?
    let country_logo: String?
    let event_home_formation: String?
    let event_away_formation: String?
    let fk_stage_key: Int?
    let stage_name: String?
    let event_quarter: String?
    let event_home_team_logo: String?
    let event_away_team_logo: String?
    let event_first_player: String?
    let first_player_key: Int?
    let event_second_player: String?
    let second_player_key: Int?
    let event_game_result: String?
    let event_serve: String?
    let event_winner: String?
    let event_first_player_logo: String?
    let event_second_player_logo: String?
    let event_date_start: String?
    let event_date_stop: String?
    let event_service_home: String?
    let event_service_away: String?
    let event_home_final_result: String?
    let event_away_final_result: String?
    let event_home_rr: String?
    let event_away_rr: String?
    let event_status_info: String?
    let event_type: String?
    let event_toss: String?
    let event_man_of_match: String?
}

struct Teams: Decodable{
    let success: Int
    let result: [TeamsResult]?
}

// MARK: - Result
struct TeamsResult :Decodable{
    let team_key: Int?
    let team_name: String?
    let team_logo: String?
    let players: [Players?]?
    let coaches: [Coach?]?
}

// MARK: - Coach
struct Coach :Decodable{
    let coachName: String?
}


struct TennisPlayer: Decodable{
    let success: Int
    let result: [Players]?
}


struct Players: Decodable {
    
    var playerKey         : Int?
    var playerName        : String?
    var playerNumber      : String?
    var playerCountry     : String?
    var playerType        : String?
    var playerAge         : String?
    var playerMatchPlayed : String?
    var playerGoals       : String?
    var playerYellowCards : String?
    var playerRedCards    : String?
    var playerImage       : String?
    
    enum CodingKeys: String, CodingKey {
        
        case playerKey         = "player_key"
        case playerName        = "player_name"
        case playerNumber      = "player_number"
        case playerCountry     = "player_country"
        case playerType        = "player_type"
        case playerAge         = "player_age"
        case playerMatchPlayed = "player_match_played"
        case playerGoals       = "player_goals"
        case playerYellowCards = "player_yellow_cards"
        case playerRedCards    = "player_red_cards"
        case playerImage       = "player_image"
        
    }
}
