//
//  CustomSearchBar.swift
//  FriendList
//
//  Created by Terry Kuo on 2023/6/12.
//

import UIKit

class CustomSearchBar : UISearchBar {
    init() {
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        searchBarStyle = .minimal
        placeholder = " Search..."
        sizeToFit()
        layer.cornerRadius = 5

        tintColor = FriendListColor.hotPink
        isTranslucent = false
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
    }
}
