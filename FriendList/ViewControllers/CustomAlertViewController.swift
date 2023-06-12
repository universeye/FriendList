//
//  CustomAlertViewController.swift
//  FriendList
//
//  Created by Terry Kuo on 2023/6/12.
//

import UIKit

class CustomAlertViewController: UIViewController {
    //MARK: - Properties
    private let containerView = AlertContainerView()

    private let titleLabel = FriendsListLabel(textAlignment: .center, fontSize: 20)
    private let messageLabel = FriendsListLabel(textAlignment: .center, fontSize: 15)
    private let actionButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Ok", for: .normal)
        button.backgroundColor = FriendListColor.hotPink
        button.layer.cornerRadius = 20
        return button
    }()


    private var alertTitle: String?
    private var message: String?
    private var buttonTitle: String?

    //MARK: - Initializers

    init(title: String, message: String, buttonTitle: String) {
        super.init(nibName: nil, bundle: nil)
        self.alertTitle = title
        self.message = message
        self.buttonTitle = buttonTitle
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    //MARK: - App Life Cycle


    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = FriendListColor.transblack
        configureContainerView()
        configureTitleLabel()
        configureActionButton()
        configureMessageLabel()
    }


    //MARK: - Functional

    @objc func dismissVC() {
        dismiss(animated: true)
    }


    //MARK: - UI Configuration


    private func configureContainerView() {
        view.addSubview(containerView)
        containerView.backgroundColor = .systemBackground
        
        NSLayoutConstraint.activate([
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor), //center vertically
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 280),
            containerView.heightAnchor.constraint(equalToConstant: 220)
        ])
    }


    private func configureTitleLabel() {
        containerView.addSubview(titleLabel)

        titleLabel.text = alertTitle ?? "Something went wrong"
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            titleLabel.heightAnchor.constraint(equalToConstant: 28)
        ])
    }

    private func configureActionButton() {
        containerView.addSubview(actionButton)
        
        actionButton.setTitle(buttonTitle ?? "Ok" , for: .normal)
        actionButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        actionButton.tintColor = .white
        
        NSLayoutConstraint.activate([
            actionButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20),
            actionButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            actionButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            actionButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }


    private func configureMessageLabel() {
        containerView.addSubview(messageLabel)
        
        messageLabel.text = message ?? "Unable to complete request"
        messageLabel.numberOfLines = 6
        
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            messageLabel.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -20),
            messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20)
        ])
    }
}
