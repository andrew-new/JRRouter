//
//  JRRouterType.swift
//  Pod
//
//  Created by 王小涛 on 16/4/26.
//  Copyright © 2016年 王小涛. All rights reserved.
//

import JLRoutes

public protocol JRRouterType {
    
    var scheme: String {get}
    var unsupportHandler: (NSURL -> Void)? {get}
    
    func isSourceSafe(source: String?) -> Bool
    
    func addRouter(routePattern: String, handler handlerBlock: (([NSObject : AnyObject]) -> Bool)?)
    func addRouter<T: JLRoutable>(routable: T.Type)
    func handleURL(openURL url: NSURL, sourceApplication: String?) -> Bool
}


public extension JRRouterType {
    
    func isSourceSafe(source: String?) -> Bool {
        
        guard let source = source else {
            print("JRRouterType cannot route because source is nil!")
            return false
        }
        
        guard let bundleIdentifier = NSBundle.mainBundle().bundleIdentifier else {
            print("JRRouterType cannot route because bundleIdentifier is nil!")
            return false
        }
        
        if source == bundleIdentifier {
            return true
        }else {
            print("JRRouterType cannot route because source \"\(source)\" is not safe!")
            return false
        }
    }
    
    func addRouter(routePattern: String, handler handlerBlock: (([NSObject : AnyObject]) -> Bool)?) {
        JLRoutes(forScheme: scheme).addRoute(routePattern, handler: handlerBlock)
    }
    
    func addRouter<T: JLRoutable>(routable: T.Type) {
        JLRoutes(forScheme: scheme).addRouter(routable)
    }
    
    func handleURL(openURL url: NSURL, sourceApplication: String?) -> Bool {
        
        guard url.scheme == scheme else {
            return false
        }
        
        print("JRRouterType begin to route to url: \(url.absoluteString)")
        guard isSourceSafe(sourceApplication) else {
            return false
        }
        
        let canRoute = JLRoutes(forScheme: scheme).routeURL(url)
        if !canRoute {
            print("JRRouterType unsupport url: \(url.absoluteString)")
            unsupportHandler?(url)
        }
        return canRoute
    }
}



