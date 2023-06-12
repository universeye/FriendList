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
    private let descriptionLabel = FriendsListLabel(textAlignment: .center, fontSize: 17, textColor: FriendListColor.brownGrey, fontWeigth: .regular)
    
    private let addFriendButton = GradientButton()
    
    private let hintLabel = FriendsListLabel(textAlignment: .center, fontSize: 15, textColor: FriendListColor.brownGrey, fontWeigth: .regular)
    
    init() {
        super.init(frame: .zero)
        commonInit()
        setGradientBackground()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        addSubview(emptyImageView)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        descriptionLabel.numberOfLines = 2
        titleLabel.text = "就從加好友開始吧：）"
        descriptionLabel.text = "與好友們一起用 KOKO 聊起來！\n還能互相收付款、發紅包喔：）"
        NSLayoutConstraint.activate([
            emptyImageView.topAnchor.constraint(equalTo: topAnchor),
            emptyImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            emptyImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            emptyImageView.heightAnchor.constraint(equalToConstant: 180),
            
            titleLabel.topAnchor.constraint(equalTo: emptyImageView.bottomAnchor, constant: 32),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            titleLabel.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func setGradientBackground() {
        addSubview(addFriendButton)
        addSubview(hintLabel)
        hintLabel.text = "幫助好友更快找到你？設定 KOKO ID"
        
        NSLayoutConstraint.activate([
            addFriendButton.widthAnchor.constraint(equalToConstant: 250),
            addFriendButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 32),
            addFriendButton.heightAnchor.constraint(equalToConstant: 43),
            addFriendButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            hintLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            hintLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            hintLabel.topAnchor.constraint(equalTo: addFriendButton.bottomAnchor, constant: 50),
            hintLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}
