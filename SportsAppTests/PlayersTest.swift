//
//  PlayersTest.swift
//  SportsAppTests
//
//  Created by Soha Ahmed Hamdy on 07/05/2023.
//

import Foundation
import XCTest
@testable import SportsApp


final class PlayersTest: XCTestCase {

    
    func testLoadTennisPlayersFromURL(){
        let expectation = expectation(description: "Waiting for the API Data")
        NetworkServices.fetchResultPlayer(sport: "tennis", playerId: 118){ result in
            
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


