//
//  EventsTest.swift
//  SportsAppTests
//
//  Created by Soha Ahmed Hamdy on 07/05/2023.
//

import XCTest
@testable import SportsApp


final class EventsTest: XCTestCase {

    
    func testLoadFootballEventsFromURL(){
        let expectation = expectation(description: "Waiting for the API Data")
        NetworkServices.fetchResultEvents(sport: "football", todayDate: "7-5-2023", weekStart: "7-5-2023", legKey: 118){ result in
            
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
    
    
    
    func testLoadBasketballEventsFromURL(){
        let expectation = expectation(description: "Waiting for the API Data")
        NetworkServices.fetchResultEvents(sport: "basketball", todayDate: "7-5-2023", weekStart: "7-5-2023", legKey: 118){ result in
            
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
    
    
    func testLoadCricketEventsFromURL(){
        let expectation = expectation(description: "Waiting for the API Data")
        NetworkServices.fetchResultEvents(sport: "cricket", todayDate: "7-5-2023", weekStart: "7-5-2023", legKey: 118){ result in
            
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
    
    func testLoadTennisEventsFromURL(){
        let expectation = expectation(description: "Waiting for the API Data")
        NetworkServices.fetchResultEvents(sport: "tennis", todayDate: "7-5-2023", weekStart: "7-5-2023", legKey: 118){ result in
            
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

