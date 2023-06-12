//
//  IsInvitingCellView.swift
//  FriendList
//
//  Created by Terry Kuo on 2023/6/11.
//

import UIKit

class IsInvitingCellView: UIView {
    
    private let avatarImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = Icon.femalePlaceHolderImage
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private let namelabel = FriendsListLabel(textAlignment: .left, fontSize: 17, textColor: .black, fontWeigth: .medium)
    private let hintlabel = FriendsListLabel(textAlignment: .left, fontSize: 15, textColor: FriendListColor.brownGrey, fontWeigth: .medium)
    private let confirmButton = CircleButton(color: FriendListColor.hotPink, image: "checkmark")
    private let refuseButton = CircleButton(color: FriendListColor.brownGrey, image: "xmark")

    init() {
        super.init(frame: .zero)
        configureButton()
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(avatarImageView)
        
        addSubview(namelabel)
        namelabel.text = "燦"
        addSubview(hintlabel)
        hintlabel.text = "邀請你成為好友：）"
        
        backgroundColor = .white
        layer.cornerRadius = 5
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 6
        layer.shadowOpacity = 0.1
        layer.shadowOffset = CGSize(width: 4, height: 4)
        layer.masksToBounds = false
        
        NSLayoutConstraint.activate([
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            avatarImageView.widthAnchor.constraint(equalToConstant: 40),
            avatarImageView.heightAnchor.constraint(equalToConstant: 40),
            avatarImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            namelabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            namelabel.trailingAnchor.constraint(equalTo: confirmButton.leadingAnchor, constant: -8),
            namelabel.heightAnchor.constraint(equalToConstant: 20),
            namelabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            
            hintlabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            hintlabel.trailingAnchor.constraint(equalTo: confirmButton.leadingAnchor, constant: -8),
            hintlabel.heightAnchor.constraint(equalToConstant: 20),
            hintlabel.topAnchor.constraint(equalTo: namelabel.bottomAnchor, constant: 4)
        ])
    }
    
    private func configureButton() {
        addSubview(confirmButton)
        addSubview(refuseButton)
        
        NSLayoutConstraint.activate([
            refuseButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            refuseButton.widthAnchor.constraint(equalToConstant: 30),
            refuseButton.heightAnchor.constraint(equalToConstant: 30),
            refuseButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            confirmButton.trailingAnchor.constraint(equalTo: refuseButton.leadingAnchor, constant: -16),
            confirmButton.widthAnchor.constraint(equalToConstant: 30),
            confirmButton.heightAnchor.constraint(equalToConstant: 30),
            confirmButton.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
