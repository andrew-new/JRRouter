//
//  AppRouter.swift
//  JRRouter
//
//  Created by 王小涛 on 16/5/13.
//  Copyright © 2016年 CocoaPods. All rights reserved.
//

import JRRouter

class AppRouter: JRRouterType {
    
    static let sharedInstance = AppRouter()
    let scheme: String = "taobao"
    let unsupportHandler: (NSURL -> Void)? = nil
}