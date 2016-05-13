//
//  dd.swift
//  JRFrameworkApp
//
//  Created by 王小涛 on 15/10/1.
//  Copyright © 2015年 王小涛. All rights reserved.
//

import JLRoutes

public protocol JLRoutable {
    
    static var routePattern: String {
        get
    }
    
    static func route(parameters parameters: [NSObject : AnyObject]!) -> Bool
}

extension JLRoutes {
    
    func addRouter<T: JLRoutable>(router: T.Type) {
        
        print("\n===========================================================\n"
            + "\(T.routePattern)"  + "  ----->  " + "\(T.self)"
            + "\n===========================================================\n")
        
        addRoute(T.routePattern) { (parameters: [NSObject : AnyObject]!) -> Bool in
            return T.route(parameters: parameters)
        }
    }
}

