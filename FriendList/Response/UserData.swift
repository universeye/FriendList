//
//  UserData.swift
//  FriendList
//
//  Created by Terry Kuo on 2023/6/9.
//

import Foundation

struct UserData: Codable {
    let response: [Response]
    
    struct Response: Codable {
        let name: String
        let kokoid: String
    }
}
