//
//  EmptyFriendView.swift
//  FriendList
//
//  Created by Terry Kuo on 2023/6/9.
//

import UIKit

class EmptyFriendView: UIView {
    
    private let emptyImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = FriendListImage.friendsEmpty
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel = FriendsListLabel(textAlignment: .center, fontSize: 23, textColor: FriendListColor.greyishBrown, fontWeigth: .medium)
    
    init() {
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        addSubview(emptyImageView)
        addSubview(titleLabel)
        titleLabel.text = "就從加好友開始吧：）"
        
        NSLayoutConstraint.activate([
            emptyImageView.topAnchor.constraint(equalTo: topAnchor),
            emptyImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            emptyImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            emptyImageView.heightAnchor.constraint(equalToConstant: 180),
            
            titleLabel.topAnchor.constraint(equalTo: emptyImageView.bottomAnchor, constant: 32),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            titleLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
}
