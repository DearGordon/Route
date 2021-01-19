//
//  NLRouteDestination.swift
//  Route
//
//  Created by Nick on 1/19/21.
//

import Foundation

final class NLRouteDestination {
    
    private let paths: [String]
    private let pattern: String
    private let handleCourse: (RouteHandleParameter) -> Bool
    
    init(routePattern: String, handle: @escaping ((RouteHandleParameter) -> Bool)) {
        self.pattern = routePattern
        self.handleCourse = handle
        
        var newPattern = routePattern
        if newPattern.hasPrefix("/") {
            newPattern.removeFirst()
        }
        self.paths = newPattern.components(separatedBy: "/")
    }
    
    func handle(request: NLRouteRequest) -> Bool {
        guard request.paths.count == paths.count else { return false }
        var para: [String: String] = [:]
        for (index, path) in paths.enumerated() {
            if path.hasPrefix(":") {
                var newPath = path
                newPath.removeFirst()
                para[newPath] = request.paths[index]
                continue
            } else if request.paths[index] == path {
                continue
            } else {
                return false
            }
        }
        request.queryItems.forEach {
            para[$0.name] = $0.value
        }
        return self.handleCourse((para, request.addPara))
    }
    
}
