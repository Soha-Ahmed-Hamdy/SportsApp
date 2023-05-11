//
//  MockNetworkService.swift
//  SportsAppTests
//
//  Created by Soha Ahmed Hamdy on 07/05/2023.
//

import Foundation
@testable import SportsApp

class MockNetworkService{
    static let mockRoot = "{\"success\":1,\"result\":[{\"league_key\":1,\"league_name\":\"European Championship\",\"country_key\":1,\"country_name\":\"eurocups\",\"league_logo\":null,\"country_logo\":null},{\"league_key\":683,\"league_name\":\"UEFA Europa Conference League\",\"country_key\":1,\"country_name\":\"eurocups\",\"league_logo\":null,\"country_logo\":null},{\"league_key\":244,\"league_name\":\"Eredivisie\",\"country_key\":82,\"country_name\":\"Netherlands\",\"league_logo\":\"\",\"country_logo\":\"\"},{\"league_key\":590,\"league_name\":\"Super Cup\",\"country_key\":15,\"country_name\":\"Armenia\",\"league_logo\":null,\"country_logo\":\"\"},{\"league_key\":591,\"league_name\":\"Malaysia Cup\",\"country_key\":76,\"country_name\":\"Malaysia\",\"league_logo\":null,\"country_logo\":\"\"},{\"league_key\":8213,\"league_name\":\"Women's International Champions Cup\",\"country_key\":2,\"country_name\":\"intl\",\"league_logo\":null,\"country_logo\":\"\"},]}"
    
 
    
    
    static let mockEvent = "{\"success\":1,\"result\":[{\"event_key\":1054085,\"event_date\":\"2023-05-15\",\"event_time\":\"19:00\",\"event_home_team\":\"Warta\",\"home_team_key\":5768,\"event_away_team\":\"Radomiak Radom\",\"away_team_key\":5783,\"event_halftime_result\":\"\",\"event_final_result\":\"-\",\"event_ft_result\":\"\",\"event_penalty_result\":\"\",\"event_status\":\"\",\"country_name\":\"Poland\",\"league_name\":\"Ekstraklasa\",\"league_key\":259,\"league_round\":\"Round 32\",\"league_season\":\"\",\"event_live\":\"0\",\"event_stadium\":\"Stadion Groclinu Dyskobolii (Grodzisk Wielkopolski)\",\"event_referee\":\"\",\"home_team_logo\":\"\",\"away_team_logo\":\"\",\"event_country_key\":91,\"league_logo\":\"\",\"country_logo\":\"\",\"event_home_formation\":\"\",\"event_away_formation\":\"\",\"fk_stage_key\":1420,\"stage_name\":\"Current\",\"league_group\":null,\"goalscorers\":[],\"substitutes\":[],\"cards\":[],\"lineups\":{\"home_team\":{\"starting_lineups\":[],\"substitutes\":[],\"coaches\":[],\"missing_players\":[]},\"away_team\":{\"starting_lineups\":[],\"substitutes\":[],\"coaches\":[],\"missing_players\":[]}},\"statistics\":[]},{\"event_key\":1054082,\"event_date\":\"2023-05-14\",\"event_time\":\"15:00\",\"event_home_team\":\"Pogon Szczecin\",\"home_team_key\":5762,\"event_away_team\":\"Mied Legnica\",\"away_team_key\":5896,\"event_halftime_result\":\"\",\"event_final_result\":\"-\",\"event_ft_result\":\"\",\"event_penalty_result\":\"\",\"event_status\":\"\",\"country_name\":\"Poland\",\"league_name\":\"Ekstraklasa\",\"league_key\":259,\"league_round\":\"Round 32\",\"league_season\":\"\",\"event_live\":\"0\",\"event_stadium\":\"Stadion Miejski im. Floriana Krygiera (Szczecin)\",\"event_referee\":\"\",\"home_team_logo\":\"\",\"away_team_logo\":\"\",\"event_country_key\":91,\"league_logo\":\"\",\"country_logo\":\"\",\"event_home_formation\":\"\",\"event_away_formation\":\"\",\"fk_stage_key\":1420,\"stage_name\":\"Current\",\"league_group\":null,\"goalscorers\":[],\"substitutes\":[],\"cards\":[],\"lineups\":{\"home_team\":{\"starting_lineups\":[],\"substitutes\":[],\"coaches\":[],\"missing_players\":[]},\"away_team\":{\"starting_lineups\":[],\"substitutes\":[],\"coaches\":[],\"missing_players\":[]}},\"statistics\":[]},]}"
    
    
    
    static let mockLivescore = "{\"success\":1,\"result\":[{\"event_key\":1183019,\"event_date\":\"2023-05-08\",\"event_time\":\"01:20\",\"event_home_team\":\"Millonarios\",\"home_team_key\":2273,\"event_away_team\":\"Santa Fe\",\"away_team_key\":2269,\"event_halftime_result\":\"1 - 0\",\"event_final_result\":\"1 - 0\",\"event_ft_result\":\"\",\"event_penalty_result\":\"\",\"event_status\":\"Half Time\",\"country_name\":\"Colombia\",\"league_name\":\"Primera A - Apertura\",\"league_key\":120,\"league_round\":\"Round 18\",\"league_season\":\"2023\",\"event_live\":\"1\",\"event_stadium\":\"Estadio Nemesio Camacho El Campin, Bogota\",\"event_referee\":\"Wilmar Roldan, Colombia\",\"home_team_logo\":\" \",\"away_team_logo\":\" \",\"event_country_key\":34,\"league_logo\":\" \",\"country_logo\":\" \",\"event_home_formation\":\"4-2-3-1\",\"event_away_formation\":\"4-2-3-1\",\"fk_stage_key\":813,\"stage_name\":\"Apertura\",\"league_group\":null}]}"
    
    
    
    static let mockTeam = "{\"success\":1,\"result\":[{\"team_key\":122,\"team_name\":\"Legia Warsaw\",\"team_logo\":\"\",\"players\":[{\"player_key\":1539688802,\"player_name\":\"K. Tobiasz\",\"player_number\":\"1\",\"player_country\":null,\"player_type\":\"Goalkeepers\",\"player_age\":\"20\",\"player_match_played\":\"23\",\"player_goals\":\"0\",\"player_yellow_cards\":\"1\",\"player_red_cards\":\"0\",\"player_image\":\"\"},{\"player_key\":398143945,\"player_name\":\"D. H\",\"player_number\":\"30\",\"player_country\":null,\"player_type\":\"Goalkeepers\",\"player_age\":\"27\",\"player_match_played\":\"7\",\"player_goals\":\"0\",\"player_yellow_cards\":\"1\",\"player_red_cards\":\"0\",\"player_image\":\"\"},{\"player_key\":1493641129,\"player_name\":\"C. Miszta\",\"player_number\":\"31\",\"player_country\":null,\"player_type\":\"Goalkeepers\",\"player_age\":\"21\",\"player_match_played\":\"0\",\"player_goals\":\"0\",\"player_yellow_cards\":\"0\",\"player_red_cards\":\"0\",\"player_image\":\"\"},{\"player_key\":4154211337,\"player_name\":\"W. Bogacz\",\"player_number\":\"37\",\"player_country\":null,\"player_type\":\"Forwards\",\"player_age\":\"18\",\"player_match_played\":\"0\",\"player_goals\":\"0\",\"player_yellow_cards\":\"0\",\"player_red_cards\":\"0\",\"player_image\":null}],\"coaches\":[{\"coach_name\":\"G. Mokry\",\"coach_country\":null,\"coach_age\":null}]}]}"
    
    
    
    
    
    static let mockPlayer = "{\"success\":1,\"result\":[{\"player_key\":3618,\"player_name\":\"\",\"player_country\":\"Portugal\",\"player_bday\":\"19.02.1997\",\"player_logo\":null,\"stats\":[{\"season\":\"2022\",\"type\":\"doubles\",\"rank\":\"148\",\"titles\":\"0\",\"matches_won\":\"2\",\"matches_lost\":\"1\",\"hard_won\":\"1\",\"hard_lost\":\"1\",\"clay_won\":\"1\",\"clay_lost\":\"0\",\"grass_won\":\"\",\"grass_lost\":\"\"},{\"season\":\"2015\",\"type\":\"singles\",\"rank\":\"1282\",\"titles\":\"0\",\"matches_won\":\"1\",\"matches_lost\":\"2\",\"hard_won\":\"0\",\"hard_lost\":\"1\",\"clay_won\":\"1\",\"clay_lost\":\"1\",\"grass_won\":\"\",\"grass_lost\":\"\"}],\"tournaments\":[{\"name\":\"Antalya 3 (Challenger)\",\"season\":\"2021\",\"type\":\"singles\",\"surface\":\"clay\",\"prize\":\"\"},{\"name\":\"M15 Antalya 5 (ITF)\",\"season\":\"2021\",\"type\":\"singles\",\"surface\":\"clay\",\"prize\":\"$15,000\"},{\"name\":\"M15 Quinta Do Lago (ITF)\",\"season\":\"2020\",\"type\":\"singles\",\"surface\":\"hard\",\"prize\":\"$15,000\"},{\"name\":\"M15 Sintra (ITF)\",\"season\":\"2020\",\"type\":\"singles\",\"surface\":\"hard\",\"prize\":\"$15000\"},{\"name\":\"M15 Monastir 3 (ITF)\",\"season\":\"2020\",\"type\":\"singles\",\"surface\":\"hard\",\"prize\":\"$15,000\"},{\"name\":\"Pensacola (ITF)\",\"season\":\"2018\",\"type\":\"singles\",\"surface\":\"clay\",\"prize\":\"$15,000\"}]}]}"
    
    
    
    static let mockTeamFav = "{\"success\":1,\"result\":[{\"team_key\":72,\"team_name\":\"Bayern Munich\",\"team_logo\":\"\",\"players\":[{\"player_key\":4105637471,\"player_name\":\"M. Neuer\",\"player_number\":\"1\",\"player_country\":null,\"player_type\":\"Goalkeepers\",\"player_age\":\"37\",\"player_match_played\":\"12\",\"player_goals\":\"0\",\"player_yellow_cards\":\"0\",\"player_red_cards\":\"0\",\"player_image\":\"\"},{\"player_key\":2500861264,\"player_name\":\"S. Ulreich\",\"player_number\":\"26\",\"player_country\":null,\"player_type\":\"Goalkeepers\",\"player_age\":\"34\",\"player_match_played\":\"3\",\"player_goals\":\"0\",\"player_yellow_cards\":\"1\",\"player_red_cards\":\"0\",\"player_image\":\"\"},{\"player_key\":3329637,\"player_name\":\"J. Musiala\",\"player_number\":\"42\",\"player_country\":null,\"player_type\":\"Forwards\",\"player_age\":\"20\",\"player_match_played\":\"29\",\"player_goals\":\"11\",\"player_yellow_cards\":\"1\",\"player_red_cards\":\"0\",\"player_image\":\"\"}],\"coaches\":[{\"coach_name\":\"T. Tuchel\",\"coach_country\":null,\"coach_age\":null}]}]}"
}

extension MockNetworkService: NetworkServicesProtocol{
    static func fetchResult(sport: String, compilitionHandler: @escaping (SportsApp.Root?) -> Void) {
        let data = Data (mockRoot.utf8)
        do{
            let result = try JSONDecoder().decode(Root.self, from: data)
            compilitionHandler(result)
        }catch let error{
            print(error.localizedDescription)
            compilitionHandler(nil)
        }
    }
    
    static func fetchResultEvents(sport: String, todayDate: String, weekStart: String, legKey: Int, compilitionHandler: @escaping (SportsApp.Fixtures?) -> Void) {
        let data = Data (mockEvent.utf8)
        do{
            let result = try JSONDecoder().decode(Fixtures.self, from: data)
            compilitionHandler(result)


        }catch let error{
            print(error.localizedDescription)
            compilitionHandler(nil)
        }

    }
    
    static func fetchResultLivescore(sport: String, legKey: Int, compilitionHandler: @escaping (SportsApp.Livescore?) -> Void) {
        let data = Data (mockLivescore.utf8)
        do{
            let result = try JSONDecoder().decode(Livescore.self, from: data)
            compilitionHandler(result)
            print("done in live")


        }catch let error{
            print(error.localizedDescription)
            compilitionHandler(nil)
        }

    }
    
    static func fetchResultPlayer(sport: String, playerId: Int, compilitionHandler: @escaping (SportsApp.TennisPlayer?) -> Void) {
        let data = Data (mockPlayer.utf8)
        do{
            let result = try JSONDecoder().decode(TennisPlayer.self, from: data)
            compilitionHandler(result)


        }catch let error{
            print(error.localizedDescription)
            compilitionHandler(nil)
        }

    }
    
    static func fetchResultTeams(sport: String, legKey: Int, compilitionHandler: @escaping (SportsApp.Teams?) -> Void) {
        let data = Data (mockTeam.utf8)
        do{
            let result = try JSONDecoder().decode(Teams.self, from: data)
            compilitionHandler(result)

        }catch let error{
            print(error.localizedDescription)
            compilitionHandler(nil)
        }

    }
    
    static func fetchResultTeamFav(sport: String, teamId: Int, compilitionHandler: @escaping (SportsApp.Teams?) -> Void) {
        let data = Data (mockTeamFav.utf8)
        do{
            let result = try JSONDecoder().decode(Teams.self, from: data)
            compilitionHandler(result)


        }catch let error{
            print(error.localizedDescription)
            compilitionHandler(nil)
        }
    }
    
    
}
