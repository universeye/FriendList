//
//  AddFriendButton.swift
//  FriendList
//
//  Created by Terry Kuo on 2023/6/12.
//

import UIKit

class AddFriendButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init() {
        self.init(frame: .zero)
    }
    
    private func configure() {
        configuration = .plain()
        configuration?.baseForegroundColor = FriendListColor.hotPink
        configuration?.image = Icon.addFriendIcon
        translatesAutoresizingMaskIntoConstraints = false
    }
}
