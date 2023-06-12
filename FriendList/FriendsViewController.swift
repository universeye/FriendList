//
//  FriendsViewController.swift
//  FriendList
//
//  Created by Terry Kuo on 2023/6/9.
//

import UIKit

class FriendsViewController: UIViewController {
    //MARK: - Properties
    private lazy var scanButton = UIBarButtonItem(image: Icon.pinkScanIcon, style: .plain, target: self, action: #selector(didTapScanButton))
    private lazy var withDrawButton = UIBarButtonItem(image: Icon.pinkWithDrawIcon, style: .plain, target: self, action: #selector(didTapWithDrawButton))
    private lazy var transferButton = UIBarButtonItem(image: Icon.pinkTransferIcon, style: .plain, target: self, action: #selector(didTapTransferButton))
    
    private lazy var userInfoView = UserInfoView()
    private let viewModel: FriendsViewModel = FriendsViewModel()
    private let refreshControlll = UIRefreshControl()
    private let emptyView = EmptyFriendView()
    private let friendListTableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 70
        tableView.register(FriendListViewCell.self, forCellReuseIdentifier: FriendListViewCell.reuseID)
        return tableView
    }()
    private let isInvitingTableView = UIView()
    private let dividerView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 4))
        view.backgroundColor = UIColor.systemGray.withAlphaComponent(0.2)
        return view
    }()
    private lazy var codeSegmented = CustumSegmentedControl(frame: CGRect(x: 0, y: 150, width: self.view.frame.width, height: 50), buttonTitle: ["好友", "聊天"])
    
    //MARK: - App's Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNav()
        setupBinding()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.getData(scenario: .friendsWithInvites)
    }
    
    private func setupBinding() {
        showLoadingView()
        viewModel.valueChanged = { [weak self](vm) in
            guard let self = self else { return }
           
            DispatchQueue.main.async {
                self.refreshControlll.endRefreshing()
                self.userInfoView.name.text = self.viewModel.userData?.name ?? ""
                self.userInfoView.kokoIDLabel.text = "KOKO ID: \(self.viewModel.userData?.kokoid ?? "")"
                self.configureUserInfoView(isInvitingDataExsist: !self.viewModel.friendListIsInviting.isEmpty)
                self.codeSegmented.setUnreadCount(isInvitingCount: self.viewModel.friendListIsInviting.count + 1, isShowUnreadCount: !self.viewModel.friendListData.isEmpty)
                if self.viewModel.friendListData.isEmpty {
                    self.configureEmptyView()
                    self.emptyView.isHidden = false
                    self.friendListTableView.isHidden = true
                } else {
                    self.emptyView.isHidden = true
                    self.configureTableView()
                    self.friendListTableView.reloadData()
                    self.friendListTableView.isHidden = false
                }
                self.dimissLoadingView()
            }
            print("Friend List Data: \(viewModel.friendListData), Friend List is Inviting: \(viewModel.friendListIsInviting)")
            
        }
    }
    
    //MARK: - Configurations
    private func configureNav() {
        view.backgroundColor = FriendListColor.white2
        
        navigationItem.rightBarButtonItem = scanButton
        navigationItem.leftBarButtonItems = [withDrawButton, transferButton]
    }
    
    private func configureUserInfoView(isInvitingDataExsist: Bool) {
        view.addSubview(userInfoView)
        view.addSubview(codeSegmented)
        view.addSubview(dividerView)
        
        if isInvitingDataExsist {
            configureIsInvitingTableView()
            codeSegmented.topAnchor.constraint(equalTo: isInvitingTableView.bottomAnchor).isActive = true
        } else {
            codeSegmented.topAnchor.constraint(equalTo: userInfoView.bottomAnchor).isActive = true
        }
        
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
            
            
            dividerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dividerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            dividerView.heightAnchor.constraint(equalToConstant: 1),
            dividerView.topAnchor.constraint(equalTo: codeSegmented.bottomAnchor, constant: 2)
        ])
    }
    
    private func configureIsInvitingTableView() {
        view.addSubview(isInvitingTableView)
        isInvitingTableView.translatesAutoresizingMaskIntoConstraints = false
        
        let isInvitingTableViewController = IsInvitingTableViewController(isInvitingMember: viewModel.friendListIsInviting, firstInvitation: viewModel.firstInvitation ?? viewModel.friendListIsInviting[0])
        add(isInvitingTableViewController, in: isInvitingTableView)
        
        NSLayoutConstraint.activate([
            isInvitingTableView.topAnchor.constraint(equalTo: userInfoView.bottomAnchor),
            isInvitingTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            isInvitingTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            isInvitingTableView.heightAnchor.constraint(greaterThanOrEqualToConstant: 190)
        ])
    }
    
    private func configureTableView() {
        view.addSubview(friendListTableView)
        friendListTableView.translatesAutoresizingMaskIntoConstraints = false
        friendListTableView.dataSource = self
        friendListTableView.delegate = self
        friendListTableView.addSubview(refreshControlll)
        refreshControlll.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        
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
            emptyView.topAnchor.constraint(equalTo: dividerView.bottomAnchor, constant: 32),
            emptyView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            emptyView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            emptyView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }
    
    @objc private func didTapWithDrawButton() {
        showLoadingView()
        isInvitingTableView.removeFromSuperview()
        viewModel.getData(scenario: .noFriends)
    }
    
    @objc private func didTapTransferButton() {
        showLoadingView()
        isInvitingTableView.removeFromSuperview()
        viewModel.getData(scenario: .friends_1)
    }
    
    @objc private func didTapScanButton() {
        showLoadingView()
        userInfoView.removeFromSuperview()
        codeSegmented.removeFromSuperview()
        dividerView.removeFromSuperview()
        friendListTableView.removeFromSuperview()
        viewModel.getData(scenario: .friendsWithInvites)
    }
    
    //MARK: Refresh Actions
    @objc private func refresh(_ sender: AnyObject) {
        viewModel.getData(scenario: .friendsWithInvites)
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
