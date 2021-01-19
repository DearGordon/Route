//
//  NLRoute.swift
//  Route
//
//  Created by Nick on 1/19/21.
//

import Foundation

typealias RouteAddParameter = [String: Any]
typealias RouteParameter = [String: String]
typealias RouteHandleParameter = (RouteParameter, RouteAddParameter)

final class NLRoute {
    
    static let shared = NLRoute()
    
    private init() { }
    
    private var destinations: [NLRouteDestination] = []
    
    func addRoute(pattern: String, handle: @escaping (RouteHandleParameter) -> Bool) {
        destinations.append(.init(routePattern: pattern, handle: handle))
    }
    
    @discardableResult
    func route(to url: URL, addPara: RouteAddParameter = [:]) -> Bool {
        let request = NLRouteRequest(url: url, addPara: addPara)
        for destination in destinations where destination.handle(request: request) {
            return true
        }
        return false
    }
    
}
