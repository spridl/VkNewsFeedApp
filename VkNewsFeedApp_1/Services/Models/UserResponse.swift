//
//  UserResponse.swift
//  VkNewsFeedApp_1
//
//  Created by T on 13.07.2021.
//  Copyright © 2021 T. All rights reserved.
//

import Foundation

struct UserResponseWrapped: Decodable {
    let response: [UserResponse]
}

struct UserResponse: Decodable {
    let photo100: String?
}
