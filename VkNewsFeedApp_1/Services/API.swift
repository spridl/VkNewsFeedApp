//
//  API.swift
//  VkNewsFeedApp_1
//
//  Created by T on 08/02/2021.
//  Copyright © 2021 T. All rights reserved.
//

import Foundation

struct API {
    static let scheme = "https"
    static let host = "api.vk.com"
    static let version = "5.126"
    
    static let newsFeed = "/method/newsfeed.get"
    static let user = "/method/users.get"
}
