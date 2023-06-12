//
//  GradientButton.swift
//  FriendList
//
//  Created by Terry Kuo on 2023/6/10.
//

import UIKit

class GradientButton: UIButton {
    
    private let gradientLayer:CAGradientLayer = CAGradientLayer()
    
    private let icon: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = Icon.addFriendWhiteIcon
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
//        gradientLayer.frame.size = self.frame.size
//        gradientLayer.colors = [UIColor.white.cgColor,UIColor.green.withAlphaComponent(1).cgColor]
//        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
//        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        addSubview(icon)
        backgroundColor = FriendListColor.hotPink
        layer.cornerRadius = 20
        layer.insertSublayer(gradientLayer, at: 0)
        setTitle("加好友", for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            icon.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            icon.centerYAnchor.constraint(equalTo: centerYAnchor),
            icon.widthAnchor.constraint(equalToConstant: 30),
            icon.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
}
