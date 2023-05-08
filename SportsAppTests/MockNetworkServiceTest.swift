//
//  MockNetworkServiceTest.swift
//  SportsAppTests
//
//  Created by Soha Ahmed Hamdy on 07/05/2023.
//

import Foundation
import XCTest
@testable import SportsApp

final class MockNetworkServiceTest: XCTestCase{
    
    func testRootDataDecoding(){
        MockNetworkService.fetchResult(sport: "football"){res in
            guard let result = res else{
                XCTFail()
                return
            }
            XCTAssertNotEqual(result.result.count,0)
        }
    }
    
    
    func testEventDataDecoding(){
        MockNetworkService.fetchResultEvents(sport: "football", todayDate: "7-5-2023", weekStart: "7-5-2023", legKey: 118){res in
            guard let result = res else{
                XCTFail()
                return
            }
            XCTAssertNotNil(result)
        }
    }
    
    
    func testLivescoreDataDecoding(){
        MockNetworkService.fetchResultLivescore(sport: "football", legKey: 118){res in
            guard let result = res else{
                XCTFail()
                return
            }
            XCTAssertNotEqual(result.result?.count,0)
        }
    }
    
    
    func testTeamDataDecoding(){
        MockNetworkService.fetchResultTeams(sport: "football", legKey: 118){res in
            guard let result = res else{
                XCTFail()
                return
            }
            XCTAssertNotEqual(result.result?.count,0)
        }
    }
    
    
    func testPlayerDataDecoding(){
        MockNetworkService.fetchResultPlayer(sport: "football", playerId: 118){res in
            guard let result = res else{
                XCTFail()
                return
            }
            XCTAssertNotNil(result)
        }
    }
    
    
    func testTeamFavDataDecoding(){
        MockNetworkService.fetchResultTeams(sport: "football", legKey: 118){res in
            guard let result = res else{
                XCTFail()
                return
            }
            XCTAssertNotEqual(result.result?.count,0)
        }
    }
}
