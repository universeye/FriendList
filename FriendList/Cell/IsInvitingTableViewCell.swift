//
//  IsInvitingTableViewCell.swift
//  FriendList
//
//  Created by Terry Kuo on 2023/6/11.
//

import UIKit

class IsInvitingTableViewCell: UITableViewCell {
    static let reuseID = "IsInvitingTableViewCell"
    
    private let containerView = UIView()
    private let namelabel = FriendsListLabel(textAlignment: .left, fontSize: 17, textColor: .black, fontWeigth: .medium)
    private let hintlabel = FriendsListLabel(textAlignment: .left, fontSize: 15, textColor: FriendListColor.brownGrey, fontWeigth: .medium)
    private let confirmButton = CircleButton(color: FriendListColor.hotPink, image: "checkmark")
    private let refuseButton = CircleButton(color: FriendListColor.brownGrey, image: "xmark")
    private let avatarImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = Icon.femalePlaceHolderImage
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureContainerView()
        configureButton()
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(name: String) {
        namelabel.text = name
    }
    
    private func configureContainerView() {
        addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 5
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowRadius = 6
        containerView.layer.shadowOpacity = 0.1
        containerView.layer.shadowOffset = CGSize(width: 4, height: 4)
        containerView.layer.masksToBounds = false
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            containerView.heightAnchor.constraint(equalToConstant: 70),
            containerView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    private func commonInit() {
        containerView.addSubview(avatarImageView)
        containerView.addSubview(namelabel)
        containerView.addSubview(hintlabel)
        
        hintlabel.text = "邀請你成為好友：）"
        
        NSLayoutConstraint.activate([
            avatarImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            avatarImageView.widthAnchor.constraint(equalToConstant: 40),
            avatarImageView.heightAnchor.constraint(equalToConstant: 40),
            avatarImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            
            namelabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            namelabel.trailingAnchor.constraint(equalTo: confirmButton.leadingAnchor, constant: -8),
            namelabel.heightAnchor.constraint(equalToConstant: 20),
            namelabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            
            hintlabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            hintlabel.trailingAnchor.constraint(equalTo: confirmButton.leadingAnchor, constant: -8),
            hintlabel.heightAnchor.constraint(equalToConstant: 20),
            hintlabel.topAnchor.constraint(equalTo: namelabel.bottomAnchor, constant: 4)
        ])
    }

    
    private func configureButton() {
        containerView.addSubview(confirmButton)
        containerView.addSubview(refuseButton)
        
        NSLayoutConstraint.activate([
            refuseButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            refuseButton.widthAnchor.constraint(equalToConstant: 30),
            refuseButton.heightAnchor.constraint(equalToConstant: 30),
            refuseButton.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            
            confirmButton.trailingAnchor.constraint(equalTo: refuseButton.leadingAnchor, constant: -16),
            confirmButton.widthAnchor.constraint(equalToConstant: 30),
            confirmButton.heightAnchor.constraint(equalToConstant: 30),
            confirmButton.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
        ])
    }
}
