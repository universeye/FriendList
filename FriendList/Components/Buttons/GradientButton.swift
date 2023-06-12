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
    
    convenience init(title: String, image: UIImage) {
        self.init(frame: .zero)
        set(title: title, image: image)
    }
    
    func set(title: String, image: UIImage) {
        setTitle(title, for: .normal)
        icon.image = image
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
        translatesAutoresizingMaskIntoConstraints = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 6
        layer.shadowOpacity = 0.1
        layer.shadowOffset = CGSize(width: 4, height: 4)
        layer.masksToBounds = false
        
        NSLayoutConstraint.activate([
            icon.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            icon.centerYAnchor.constraint(equalTo: centerYAnchor),
            icon.widthAnchor.constraint(equalToConstant: 30),
            icon.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
}
