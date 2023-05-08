//
//  SportsAppTests.swift
//  SportsAppTests
//
//  Created by Soha Ahmed Hamdy on 07/05/2023.
//

import XCTest
@testable import SportsApp


final class SportsAppTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
        
    }

    func testExample() throws {
        
    }

    func testPerformanceExample() throws {
        measure {
        }
    }
    
    func testLoadFootballLeaguesFromURL(){
        let expectation = expectation(description: "Waiting for the API Data")
        NetworkServices.fetchResult(sport: "football"){ result in
            
            guard let result = result else{
                XCTFail()
                expectation.fulfill()
                return
            }
            XCTAssertNotEqual(result.result.count,0, "Failed ..")
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5)
    }
    
    
    
    func testLoadBasketballLeaguesFromURL(){
        let expectation = expectation(description: "Waiting for the API Data")
        NetworkServices.fetchResult(sport: "basketball"){ result in
            
            guard let result = result else{
                XCTFail()
                expectation.fulfill()
                return
            }
            XCTAssertNotEqual(result.result.count,0, "Failed ..")
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5)
    }
    
    
    func testLoadCricketLeaguesFromURL(){
        let expectation = expectation(description: "Waiting for the API Data")
        NetworkServices.fetchResult(sport: "cricket"){ result in
            
            guard let result = result else{
                XCTFail()
                expectation.fulfill()
                return
            }
            XCTAssertNotEqual(result.result.count,0, "Failed ..")
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5)
    }
    
    func testLoadTennisLeaguesFromURL(){
        let expectation = expectation(description: "Waiting for the API Data")
        NetworkServices.fetchResult(sport: "tennis"){ result in
            
            guard let result = result else{
                XCTFail()
                expectation.fulfill()
                return
            }
            XCTAssertNotNil(result)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5)
    }
    
    
    

}
