//
//  TaobaoItemViewController.swift
//  JRRouter
//
//  Created by 王小涛 on 16/5/16.
//  Copyright © 2016年 CocoaPods. All rights reserved.
//

import JRRouter

class TaobaoItemViewController: UIViewController, JLRoutable {

    static var routePattern: String {
        return "items/:id"
    }
    
    static func route(parameters parameters: [NSObject : AnyObject]!) -> Bool {
        let controller = TaobaoItemViewController()
        let id = parameters["id"] as? String
        print("id = \(id)")
        let root = UIApplication.sharedApplication().keyWindow?.rootViewController as? UINavigationController
        root?.pushViewController(controller, animated: true)
        return true
    }
}
