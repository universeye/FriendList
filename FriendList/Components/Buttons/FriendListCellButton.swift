//
//  FriendListCellButton.swift
//  FriendList
//
//  Created by Terry Kuo on 2023/6/10.
//

import UIKit

class FriendListCellButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(color: UIColor, title: String) {
        self.init(frame: .zero)
        set(color: color, title: title)
    }
    
    private func configure() {
        layer.borderWidth = 1
        layer.cornerRadius = 3
        configuration = .plain()
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func set(color: UIColor, title: String) {
        configuration?.baseForegroundColor = color
        configuration?.title = title
        configuration?.attributedTitle?.font = .systemFont(ofSize: 15)
        layer.borderColor = color.cgColor
    }
}
