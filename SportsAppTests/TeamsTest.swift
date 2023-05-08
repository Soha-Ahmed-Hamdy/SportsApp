//
//  TeamsTest.swift
//  SportsAppTests
//
//  Created by Soha Ahmed Hamdy on 07/05/2023.
//

import Foundation
import XCTest
@testable import SportsApp


final class TeamsTest: XCTestCase {

    
    func testLoadFootballTeamsFromURL(){
        let expectation = expectation(description: "Waiting for the API Data")
        NetworkServices.fetchResultTeams(sport: "football", legKey: 118){ result in
            
            guard let result = result else{
                XCTFail()
                expectation.fulfill()
                return
            }
            XCTAssertNotEqual(result.result?.count, 0)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5)
    }
    
    
    
    func testLoadBasketballTeamsFromURL(){
        let expectation = expectation(description: "Waiting for the API Data")
        NetworkServices.fetchResultTeams(sport: "basketball", legKey: 118){ result in
            
            guard let result = result else{
                XCTFail()
                expectation.fulfill()
                return
            }
            XCTAssertNotEqual(result.result?.count, 0)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5)
    }
       
    
    
    func testLoadCricketTeamsFromURL(){
        let expectation = expectation(description: "Waiting for the API Data")
        NetworkServices.fetchResultTeams(sport: "cricket", legKey: 118){ result in
            
            guard let result = result else{
                XCTFail()
                expectation.fulfill()
                return
            }
            XCTAssertNotEqual(result.result?.count, 0)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5)
    }
    
    func testLoadFavouriteTeamsFromURL(){
        let expectation = expectation(description: "Waiting for the API Data")
        NetworkServices.fetchResultTeamFav(sport: "football", teamId: 118){ result in
            
            guard let result = result else{
                XCTFail()
                expectation.fulfill()
                return
            }
            XCTAssertNotEqual(result.result?.count, 0)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5)
    }
    

}

