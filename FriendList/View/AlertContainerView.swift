//
//  AlertContainerView.swift
//  FriendList
//
//  Created by Terry Kuo on 2023/6/12.
//
import UIKit

class AlertContainerView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    convenience init(backgroundColor: UIColor = .systemBackground) {
        self.init(frame: .zero)
        self.backgroundColor = backgroundColor
        
    }

    private func configure() {
        layer.cornerRadius = 16
        translatesAutoresizingMaskIntoConstraints = false
    }
}
