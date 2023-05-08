//
//  LatestResultTest.swift
//  SportsAppTests
//
//  Created by Soha Ahmed Hamdy on 07/05/2023.
//

import Foundation

import XCTest
@testable import SportsApp


final class LatestResultTest: XCTestCase {

    
    func testLoadFootballLatestFromURL(){
        let expectation = expectation(description: "Waiting for the API Data")
        NetworkServices.fetchResultLivescore(sport: "football", legKey: 118){ result in
            
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
    
    
    
    func testLoadBasketballLatestFromURL(){
        let expectation = expectation(description: "Waiting for the API Data")
        NetworkServices.fetchResultLivescore(sport: "basketball", legKey: 118){ result in
            
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
       
    
    
func testLoadCricketLatestFromURL(){
    let expectation = expectation(description: "Waiting for the API Data")
    NetworkServices.fetchResultLivescore(sport: "cricket", legKey: 118){ result in
        
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
    
    func testLoadtennisLatestFromURL(){
        let expectation = expectation(description: "Waiting for the API Data")
        NetworkServices.fetchResultLivescore(sport: "tennis", legKey: 118){ result in
            
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
