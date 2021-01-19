//
//  NLRouteRequest.swift
//  Route
//
//  Created by Nick on 1/19/21.
//

import Foundation

final class NLRouteRequest {
    
    private(set) var paths: [String] = []
    private(set) var queryItems: [URLQueryItem] = []
    private(set) var addPara: RouteAddParameter = [:]
    
    init(url: URL, addPara: RouteAddParameter) {
        guard let urlComp = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
            return
        }
        self.addPara = addPara
        var newPattern = urlComp.path
        if newPattern.hasPrefix("/") {
            newPattern.removeFirst()
        }
        self.paths = newPattern.components(separatedBy: "/")
        if let items = urlComp.queryItems {
            self.queryItems = items
        }
    }
}
