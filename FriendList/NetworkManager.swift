//
//  NetworkManager.swift
//  FriendList
//
//  Created by Terry Kuo on 2023/6/9.
//

import UIKit

class NetworkManager {
    static let shared = NetworkManager()
    private let baseURL = "https://dimanyen.github.io/"
    
    private init() {}
    func getUserData() async throws -> UserData {
        let endpoint = baseURL + "man.json"
        guard let url = URL(string: endpoint) else { throw FriendListError.invalidSearchTerm }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw FriendListError.invalidResponse }
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(UserData.self, from: data) else { throw FriendListError.failedToDecode }
        return decodedData
    }
    
    func getFriendsData(scenario: Scenario) async throws -> Friends {
        var path: String = ""
        switch scenario {
        case .noFriends:
            path = "friend4.json"
        case .friends_1:
            path = "friend1.json"
        case .friends_2:
            path = "friend2.json"
        case .friendsWithInvites:
            path = "friend3.json"
        }
        let endpoint = baseURL + path
        guard let url = URL(string: endpoint) else { throw FriendListError.invalidSearchTerm }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw FriendListError.invalidResponse }
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(Friends.self, from: data) else { throw FriendListError.failedToDecode }
        return decodedData
    }
}
