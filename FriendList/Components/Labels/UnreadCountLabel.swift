//
//  UnreadCountLabel.swift
//  FriendList
//
//  Created by Terry Kuo on 2023/6/12.
//

import UIKit

class UnreadCountLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init() {
        self.init(frame: .zero)
    }
    
    private func configure() {
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.9 //90%
        
       translatesAutoresizingMaskIntoConstraints =  false
       textColor = .white
       layer.backgroundColor = FriendListColor.softPink.cgColor
       layer.cornerRadius = 9
       font = UIFont.systemFont(ofSize: 12, weight: .regular)
       textAlignment = .center
    }
}
