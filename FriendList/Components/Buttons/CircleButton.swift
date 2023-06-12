//
//  CircleButton.swift
//  FriendList
//
//  Created by Terry Kuo on 2023/6/11.
//

import UIKit

class CircleButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(color: UIColor, image: String) {
        self.init(frame: .zero)
        set(color: color, image: image)
    }
    
    private func configure() {
        layer.borderWidth = 1
        layer.cornerRadius = 15
        configuration = .plain()
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func set(color: UIColor, image: String) {
        configuration?.baseForegroundColor = color
        configuration?.image = UIImage(systemName: image, withConfiguration: UIImage.SymbolConfiguration(pointSize: 12, weight: .regular))
        layer.borderColor = color.cgColor
    }

}
