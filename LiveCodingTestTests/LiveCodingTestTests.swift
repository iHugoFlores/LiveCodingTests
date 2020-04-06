//
//  LiveCodingTestTests.swift
//  LiveCodingTestTests
//
//  Created by Field Employee on 4/6/20.
//  Copyright © 2020 Hugo Flores. All rights reserved.
//

import XCTest
@testable import LiveCodingTest

class LiveCodingTestTests: XCTestCase {
    
    let challenges = LiveCodingTest.Challenges()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testChallenge2_1() throws {
        var input = [1, 7, 5, 7, 4, 7, 7, 3, 5, 5, 2, 2]
        var expected = [1,3,4,2,2,5,5,5,7,7,7,7]
        XCTAssertEqual(challenges.challenge2_1(myarr: input), expected, "Challenge 2.1 Failed")
        
        input = [1,1,1,1]
        expected = [1,1,1,1]
        XCTAssertEqual(challenges.challenge2_1(myarr: input), expected, "Challenge 2.1 Failed")
    }
    
    func testChallenge2_2() throws {
        var input: [Int] = []
        XCTAssertNil(challenges.challenge2_2(in: input), "Challenge 2.2 Failed")
        input = [1]
        XCTAssertNil(challenges.challenge2_2(in: input), "Challenge 2.2 Failed")
        
        input = [10, 6]
        var expected = 6
        XCTAssertEqual(challenges.challenge2_2(in: input), expected, "Challenge 2.2 Failed")
        input = [0, 0, 0, 0]
        expected = 0
        XCTAssertEqual(challenges.challenge2_2(in: input), expected, "Challenge 2.2 Failed")
    }
    
    func testChallenge3_1() throws {
        let inputArr: [Int] = [1,2,3,4,5]
        let sum: Int = 5
        let expected: Int = 2
        XCTAssertEqual(challenges.challenge3_1(inputArr, sum), expected, "Challenge 3.1 Failed")
    }
    
    func testChallenge3_2() throws {
        let input = "hello world"
        let expected = "helloWorld"
        XCTAssertEqual(input.camelCase(), expected, "Challenge 3.2 Failed")
    }
    
    func testChallenge4_1() throws {
        var input = "he sheep she sheep we sheep sheep sheep"
        var expected = "sheep"
        XCTAssertEqual(challenges.challenge4_1(input), expected, "Challenge 4.1 Failed")
        
        input = "hello Swift Swift Swift and Swift"
        expected = "Swift"
        XCTAssertEqual(challenges.challenge4_1(input), expected, "Challenge 4.1 Failed")
    }
    
    func testChallenge4_2() throws {
        var expected = "at ten o'clock"
        XCTAssertEqual(challenges.challenge4_2(atLocale: "en_US", hour: 10), expected, "Challenge 4.1 Failed")
        
        expected = "a las diez"
        XCTAssertEqual(challenges.challenge4_2(atLocale: "es", hour: 10), expected, "Challenge 4.1 Failed")
    }
    
    func testChallenge5_2() throws {
        XCTAssertEqual(challenges.challenge5_2(in: "Amanda lives in Manhattan"), 6, "Challenge 5.2 Failed")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
