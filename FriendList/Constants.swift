//
//  Constants.swift
//  Constants
//
//  Created by Terry Kuo on 2023/6/9.
//

import UIKit

enum FriendListError:  String, Error {
    case invalidSearchTerm = "This search term created an Invalid request."
    case unableToComplete = "Unable to complete your requst, please try again later."
    case invalidResponse = "Invalid response from the server , please check the search term."
    case invalidData = "The data from the server recieved was invalid."
    case failedToDecode = "Decoding Falied."
}

enum Scenario {
    case noFriends
    case friends_1
    case friends_2
    case friendsWithInvites
}

struct Icon {
    static let pinkScanIcon = UIImage(named: "pinkScan")!.withRenderingMode(.alwaysOriginal)
    static let pinkTransferIcon = UIImage(named: "pinkTransfer")!.withRenderingMode(.alwaysOriginal)
    static let pinkWithDrawIcon = UIImage(named: "pinkWithDraw")!.withRenderingMode(.alwaysOriginal)
    static let addFriendIcon = UIImage(named: "addFriendIcon")!.withRenderingMode(.alwaysOriginal)
    static let femalePlaceHolderImage = UIImage(named: "femalePlaceHolderImage")!.withRenderingMode(.alwaysOriginal)
    static let addFriendWhiteIcon = UIImage(named: "addFriendWhiteIcon")!.withRenderingMode(.alwaysOriginal)
    static let productsIcon = UIImage(named: "moneyIcon")!.withRenderingMode(.alwaysTemplate)
    static let friendIcon = UIImage(named: "friendIcon")!.withRenderingMode(.alwaysTemplate)
    static let manageIcon = UIImage(named: "manageIcon")!.withRenderingMode(.alwaysTemplate)
    static let kokoHomeIcon = UIImage(named: "kokoHomeIcon")!.withRenderingMode(.alwaysOriginal)
}

struct FriendListImage{
    static let friendsEmpty = UIImage(named: "friendsEmpty")!
}

enum FriendListFont {
    static let pingFangMedium = "PingFang-Medium"
}

struct FriendListColor {
    static let white2 = UIColor(named: "white2")!
    static let greyishBrown = UIColor(named: "greyishBrown")!
    static let hotPink = UIColor(named: "hotPink")!
    static let favoriteStar = UIColor(named: "favoriteColor")!
    static let brownGrey = UIColor(named: "brownGrey")!
    static let softPink = UIColor(named: "softPink")!
    static let booger = UIColor(named: "booger")!
    static let frogGreen = UIColor(named: "frogGreen")!
}
