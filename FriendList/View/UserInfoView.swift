//
//  UserInfoView.swift
//  FriendList
//
//  Created by Terry Kuo on 2023/6/9.
//

import UIKit

class UserInfoView: UIView {
    
    var name: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: FriendListFont.pingFangMedium, size: 17)
        return label
    }()
    
    var kokoIDLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 13)
        return label
    }()
    
    private let avatarImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = Icon.femalePlaceHolderImage
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    init() {
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        name.text = "姓名"
        kokoIDLabel.text = "KOKO ID："
        backgroundColor = FriendListColor.white2
        addSubview(name)
        addSubview(kokoIDLabel)
        addSubview(avatarImageView)
        
        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            name.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            name.widthAnchor.constraint(equalToConstant: 100),
            name.heightAnchor.constraint(equalToConstant: 30),
            
            kokoIDLabel.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 4),
            kokoIDLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            kokoIDLabel.widthAnchor.constraint(equalToConstant: 200),
            kokoIDLabel.heightAnchor.constraint(equalToConstant: 20),
            
            avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            avatarImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            avatarImageView.widthAnchor.constraint(equalToConstant: 60),
            avatarImageView.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
}
