//
//  RouteTests.swift
//  RouteTests
//
//  Created by Nick on 1/6/21.
//

import XCTest
@testable import Route

class RouteTests: XCTestCase {

    func testRoute01() {
        
        NLRoute.shared.addRoute(pattern: "meet/:date") { para, add in
            XCTAssertTrue(para.keys.contains("date"), "can't find the key.")
            XCTAssertTrue(para["date"] == "20210119", "date error.")
            XCTAssertTrue(add["hi"] as? Int == 1234)
            XCTAssertTrue(para["lesson"] == "route", "can't got queryItems")
            return true
        }
    
        let url = URL(string: "https://nick:handsome@iOS.Taipei:6666/meet/20210119?lesson=route#agenda")!
        
        XCTAssertTrue(NLRoute.shared.route(to: url, addPara: ["hi": 1234]), "no handle.")
    }

}
