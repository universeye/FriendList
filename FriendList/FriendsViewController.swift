//
//  FriendsViewController.swift
//  FriendList
//
//  Created by Terry Kuo on 2023/6/9.
//

import UIKit

class FriendsViewController: UIViewController {
    private lazy var scanButton = UIBarButtonItem(image: Icon.pinkScanIcon, style: .plain, target: self, action: #selector(didTapFeatureList))
    private lazy var withDrawButton = UIBarButtonItem(image: Icon.pinkWithDrawIcon, style: .plain, target: self, action: #selector(didTapFeatureList))
    private lazy var transferButton = UIBarButtonItem(image: Icon.pinkTransferIcon, style: .plain, target: self, action: #selector(didTapFeatureList))
    
    private lazy var userInfoView = UserInfoView()
    private let viewModel: FriendsViewModel = FriendsViewModel()
    private let emptyView = EmptyFriendView()
    private let friendListTableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 70
        tableView.register(FriendListViewCell.self, forCellReuseIdentifier: FriendListViewCell.reuseID)
        return tableView
    }()
    private let dividerView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 4))
        view.backgroundColor = UIColor.systemGray.withAlphaComponent(0.2)
        return view
    }()
    lazy var codeSegmented = CustumSegmentedControl(frame: CGRect(x: 0, y: 150, width: self.view.frame.width, height: 50), buttonTitle: ["好友", "聊天"])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNav()
        configureUserInfoView()
        setupBinding()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.getData(scenario: .friends_1)
    }
    
    private func setupBinding() {
        showLoadingView()
        viewModel.valueChanged = { [weak self](vm) in
            guard let self = self else { return }
           
            DispatchQueue.main.async {
                self.userInfoView.name.text = self.viewModel.userData?.name ?? ""
                self.userInfoView.kokoIDLabel.text = "KOKO ID: \(self.viewModel.userData?.kokoid ?? "")"
                
                if self.viewModel.friendListData.isEmpty {
                    self.configureEmptyView()
                    self.emptyView.isHidden = false
                } else {
                    self.emptyView.isHidden = true
                    self.configureTableView()
                    self.friendListTableView.reloadData()
                }
            }
            print("S: \(viewModel.friendListData)")
            dimissLoadingView()
        }
    }
    
    private func configureNav() {
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = scanButton
        navigationItem.leftBarButtonItems = [withDrawButton, transferButton]
    }
    
    private func configureUserInfoView() {
        view.addSubview(userInfoView)
        view.addSubview(codeSegmented)
        view.addSubview(dividerView)
        codeSegmented.translatesAutoresizingMaskIntoConstraints = false
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        userInfoView.translatesAutoresizingMaskIntoConstraints = false
        codeSegmented.delegte = self
        codeSegmented.backgroundColor = .clear
        
        NSLayoutConstraint.activate([
            userInfoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            userInfoView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            userInfoView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            userInfoView.heightAnchor.constraint(equalToConstant: 90),
            
            codeSegmented.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            codeSegmented.widthAnchor.constraint(equalToConstant: 150),
            codeSegmented.heightAnchor.constraint(equalToConstant: 40),
            codeSegmented.topAnchor.constraint(equalTo: userInfoView.bottomAnchor),
            
            dividerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dividerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            dividerView.heightAnchor.constraint(equalToConstant: 1),
            dividerView.topAnchor.constraint(equalTo: codeSegmented.bottomAnchor, constant: 2)
        ])
    }
    
    private func configureTableView() {
        view.addSubview(friendListTableView)
        friendListTableView.translatesAutoresizingMaskIntoConstraints = false
        friendListTableView.dataSource = self
        friendListTableView.delegate = self
        
        NSLayoutConstraint.activate([
            friendListTableView.topAnchor.constraint(equalTo: dividerView.bottomAnchor),
            friendListTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            friendListTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            friendListTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func configureEmptyView() {
        view.addSubview(emptyView)
        emptyView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            emptyView.topAnchor.constraint(equalTo: userInfoView.bottomAnchor, constant: 16),
            emptyView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            emptyView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            emptyView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }
    
    @objc private func didTapFeatureList() {
        
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource
extension FriendsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.friendListData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FriendListViewCell.reuseID, for: indexPath) as? FriendListViewCell else {
            fatalError()
        }
        let data = viewModel.friendListData[indexPath.row]
        cell.set(
            name: data.name,
            isTop: data.isTop,
            status: data.status)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

//MARK: - CUSTUMSegmentedControl Delegate
extension FriendsViewController: CustumSegmentedControlDelegate {
    func chageToIndex(index: Int) {
        print(index)
    }
}
