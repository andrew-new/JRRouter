//
//  JRAppRouterType.swift
//  Pod
//
//  Created by 王小涛 on 16/4/26.
//  Copyright © 2016年 王小涛. All rights reserved.
//

public protocol JRAppRouterType {
    
    var router: JRRouter {get}
    var unsupportHandler: (NSURL -> Void)? {get}
    
    func isSourceSafe(source: String?) -> Bool
    func addRouter<T: JLRoutable>(routable: T.Type)
    func handleURL(openURL url: NSURL, sourceApplication: String?) -> Bool
}


public extension JRAppRouterType {
    
    func addRouter<T: JLRoutable>(routable: T.Type) {
        router.addRouter(routable)
    }
    
    func handleURL(openURL url: NSURL, sourceApplication: String?) -> Bool {
        
        guard isURLMatchAppRouterScheme(url) else {
            return false
        }
        
        guard isSourceSafe(sourceApplication) else {
            return false
        }
        
        let canRoute = router.routeURL(url)
        if !canRoute {
            unsupportHandler?(url)
        }
        return canRoute
    }
    
    private func isURLMatchAppRouterScheme(url: NSURL) -> Bool {
        return url.scheme == router.scheme
    }
}



