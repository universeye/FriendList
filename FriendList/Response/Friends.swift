//
//  Friends.swift
//  FriendList
//
//  Created by Terry Kuo on 2023/6/9.
//

import Foundation

struct Friends: Codable {
    let response: [Response]
    
    struct Response: Codable {
        let name: String
        let status: Int
        let isTop: String
        let fid: String
        let updateDate: String
    }
}
