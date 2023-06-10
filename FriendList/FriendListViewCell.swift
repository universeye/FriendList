//
//  FriendListViewCell.swift
//  FriendList
//
//  Created by Terry Kuo on 2023/6/10.
//

import UIKit

class FriendListViewCell: UITableViewCell {
    static let reuseID = "FriendListViewCell"
    
    private var label = UILabel(frame: .zero)
    
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Icon.femalePlaceHolderImage
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let transferButton = FriendListCellButton(color: FriendListColor.hotPink, title: "轉帳")
    private let isInviting = FriendListCellButton(color: .systemGray3, title: "邀請中")
    
    private let moreButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "ellipsis", withConfiguration: UIImage.SymbolConfiguration(pointSize: 19, weight: .bold)), for: .normal)
        button.tintColor = .systemGray3
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let favoriteButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "star.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 15, weight: .bold)), for: .normal)
        button.tintColor = FriendListColor.favoriteStar
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: - Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureFavoriteButton()
        configureAvatar()
        configureLabel()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(name: String, isTop: String, status: Int) {
        label.text = name
        if isTop == "1" {
            favoriteButton.isHidden = false
        } else {
            favoriteButton.isHidden = true
        }
        
        if status == 2 {
            configureIsInviting()
            configureTransferButton()
            transferButton.trailingAnchor.constraint(equalTo: isInviting.leadingAnchor, constant: -8).isActive = true
        } else {
            configureMoreButton()
            configureTransferButton()
            transferButton.trailingAnchor.constraint(equalTo: moreButton.leadingAnchor, constant: -8).isActive = true
        }
    }
    
    
    private func configureAvatar() {
        addSubview(avatarImageView)
        
        NSLayoutConstraint.activate([
            avatarImageView.leadingAnchor.constraint(equalTo: favoriteButton.trailingAnchor, constant: 8),
            avatarImageView.heightAnchor.constraint(equalToConstant: 40),
            avatarImageView.widthAnchor.constraint(equalToConstant: 40),
            avatarImageView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    private func configureLabel() {
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            label.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            label.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    private func configureMoreButton() {
        addSubview(moreButton)
        isInviting.removeFromSuperview()
        
        NSLayoutConstraint.activate([
            moreButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            moreButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            moreButton.widthAnchor.constraint(equalToConstant: 55),
            moreButton.heightAnchor.constraint(equalToConstant: 27),
        ])
    }
    
    private func configureIsInviting() {
        addSubview(isInviting)
        moreButton.removeFromSuperview()
        
        NSLayoutConstraint.activate([
            isInviting.centerYAnchor.constraint(equalTo: centerYAnchor),
            isInviting.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            isInviting.widthAnchor.constraint(equalToConstant: 70),
            isInviting.heightAnchor.constraint(equalToConstant: 27),
        ])
    }
    
    private func configureTransferButton() {
        addSubview(transferButton)
        transferButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            transferButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            transferButton.widthAnchor.constraint(equalToConstant: 55),
            transferButton.heightAnchor.constraint(equalToConstant: 27)
        ])
    }
    
    
    private func configureFavoriteButton() {
        addSubview(favoriteButton)
        
        NSLayoutConstraint.activate([
            favoriteButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            favoriteButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            favoriteButton.widthAnchor.constraint(equalToConstant: 20),
            favoriteButton.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
