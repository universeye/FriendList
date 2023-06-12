//
//  SelectorViewController.swift
//  FriendList
//
//  Created by Terry Kuo on 2023/6/12.
//

import UIKit

class SelectorViewController: UIViewController {
    
    private let noFriendButton = GradientButton(title: "無好友", image: UIImage(systemName: "chevron.right", withConfiguration: UIImage.SymbolConfiguration(pointSize: 14, weight: .medium))!)
    private let friendListButton = GradientButton(title: "好友列表", image: UIImage(systemName: "chevron.right", withConfiguration: UIImage.SymbolConfiguration(pointSize: 14, weight: .medium))!)
    private let friendListWithInvitationButton = GradientButton(title: "好友列表含邀請", image: UIImage(systemName: "chevron.right", withConfiguration: UIImage.SymbolConfiguration(pointSize: 14, weight: .medium))!)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "選擇情境"
        navigationController?.navigationBar.prefersLargeTitles = false
        configureButton()
    }
    
    private func configureButton() {
        view.addSubview(noFriendButton)
        view.addSubview(friendListButton)
        view.addSubview(friendListWithInvitationButton)
        noFriendButton.addTarget(self, action: #selector(noFriendButtonTapped), for: .touchUpInside)
        noFriendButton.tintColor = .white
        friendListButton.addTarget(self, action: #selector(friendListButtonTapped), for: .touchUpInside)
        friendListButton.tintColor = .white
        friendListWithInvitationButton.addTarget(self, action: #selector(friendListWithInvitaitonButtonTapped), for: .touchUpInside)
        friendListWithInvitationButton.tintColor = .white
        
        NSLayoutConstraint.activate([
            noFriendButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            noFriendButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            noFriendButton.widthAnchor.constraint(equalToConstant: 250),
            noFriendButton.heightAnchor.constraint(equalToConstant: 60),
            
            friendListButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            friendListButton.widthAnchor.constraint(equalToConstant: 250),
            friendListButton.heightAnchor.constraint(equalToConstant: 60),
            friendListButton.topAnchor.constraint(equalTo: noFriendButton.bottomAnchor, constant: 16),
            
            friendListWithInvitationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            friendListWithInvitationButton.widthAnchor.constraint(equalToConstant: 250),
            friendListWithInvitationButton.heightAnchor.constraint(equalToConstant: 60),
            friendListWithInvitationButton.topAnchor.constraint(equalTo: friendListButton.bottomAnchor, constant: 16),
        ])
    }
    
    @objc private func noFriendButtonTapped() {
        let vc = FriendsViewController(currentScenario: .noFriends)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func friendListButtonTapped() {
        let vc = FriendsViewController(currentScenario: .friends_1)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func friendListWithInvitaitonButtonTapped() {
        let vc = FriendsViewController(currentScenario: .friendsWithInvites)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
