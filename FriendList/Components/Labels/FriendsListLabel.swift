//
//  FriendsListLabel.swift
//  FriendList
//
//  Created by Terry Kuo on 2023/6/9.
//

import UIKit

class FriendsListLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(textAlignment: NSTextAlignment = .left, fontSize: CGFloat, textColor: UIColor = .label, fontWeigth: UIFont.Weight = .regular) {
        self.init(frame: .zero)
        self.textAlignment = textAlignment
        self.font = UIFont.systemFont(ofSize: fontSize, weight: fontWeigth)
        self.textColor = textColor
    }
    
    private func configure() {
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.9 //90%
        lineBreakMode = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }

}
