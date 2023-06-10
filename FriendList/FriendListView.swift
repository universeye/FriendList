//
//  FriendListView.swift
//  FriendList
//
//  Created by Terry Kuo on 2023/6/10.
//

import UIKit

class FriendListView: UIView {
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .green
        tableView.register(FriendListViewCell.self, forCellReuseIdentifier: FriendListViewCell.reuseID)
        return tableView
    }()
    
    init() {
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        addSubview(tableView)
        tableView.frame = bounds
    }
}
