//
//  FriendsViewModel.swift
//  FriendList
//
//  Created by Terry Kuo on 2023/6/9.
//

import Foundation

class FriendsViewModel {
    
    var userData: UserData.Response?  {
        didSet {
            valueChanged?(self)
        }
    }
    
    var friendListData: [Friends.Response] = [] {
        didSet {
            valueChanged?(self)
        }
    }
    
    var valueChanged: ((FriendsViewModel) -> Void)?
    
    func getData(scenario: Scenario) {
        self.friendListData = []
        Task {
            do {
                let userData = try await NetworkManager.shared.getUserData()
                
                if scenario == .friends_1 {
                    async let friendListData1Call = try NetworkManager.shared.getFriendsData(scenario: .friends_1)
                    async let friendListData2Call = try NetworkManager.shared.getFriendsData(scenario: .friends_2)
                    
                    let (friendListData1Result, friendListData2Result) = try await (friendListData1Call, friendListData2Call)
                    
                    
                    var friendResults: [Friends.Response] = []
                    friendResults = friendListData1Result.response.map { $0 }
                    friendResults.append(contentsOf: friendListData2Result.response.map { $0 })
                    friendResults = friendResults.sorted { $0.updateDate > $1.updateDate }
                    
                    var friendListDataUnique: [Friends.Response] = []
                    for friendResult in friendResults {
                        if !friendListDataUnique.contains(where: { $0.fid == friendResult.fid }) {
                            friendListDataUnique.append(friendResult)
                        }
                    }
                    
                    self.friendListData = friendListDataUnique.sorted { ($0.status, $0.isTop) > ($1.status, $1.isTop) }
                    
                } else {
                    let friendData_1 = try await NetworkManager.shared.getFriendsData(scenario: scenario)
                    self.friendListData = friendData_1.response.map { $0 }.sorted { ($0.status, $0.isTop) > ($1.status, $1.isTop) }
                }
                
                self.userData = userData.response[0]
                
            } catch {
                print("Error: \(error)")
            }
        }
    }
}
