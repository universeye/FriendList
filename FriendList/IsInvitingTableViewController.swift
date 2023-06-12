//
//  IsInvitingTableViewController.swift
//  FriendList
//
//  Created by Terry Kuo on 2023/6/11.
//

import UIKit

class IsInvitingTableViewController: UIViewController {
    
    var hiddenSections = Set<Int>()
    var isInvitingMember: [Friends.Response]
    var isInvitingMemberData: [[Friends.Response]] = []
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 80
        tableView.backgroundColor = FriendListColor.white2
        tableView.showsVerticalScrollIndicator = false
        tableView.allowsSelection = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(IsInvitingTableViewCell.self, forCellReuseIdentifier: IsInvitingTableViewCell.reuseID)
        return tableView
    }()
    var tag: Int = 0
    
    var firstInvitation: Friends.Response
    
    init(isInvitingMember: [Friends.Response],firstInvitation: Friends.Response) {
        self.isInvitingMember = isInvitingMember
        self.firstInvitation = firstInvitation
        super.init(nibName: nil, bundle: nil)
        self.isInvitingMemberData.append(isInvitingMember)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    @objc private func hideSection() {
        let section = tag
        
        func indexPathsForSection() -> [IndexPath] {
            var indexPaths = [IndexPath]()
            
            for row in 0..<self.isInvitingMemberData[section].count {
                indexPaths.append(IndexPath(row: row,
                                            section: section))
            }
            
            return indexPaths
        }
        
        if self.hiddenSections.contains(section) {
            self.hiddenSections.remove(section)
            self.tableView.insertRows(at: indexPathsForSection(),
                                      with: .fade)
        } else {
            self.hiddenSections.insert(section)
            self.tableView.deleteRows(at: indexPathsForSection(),
                                      with: .fade)
        }
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
    }
}

//MARK: - UITableViewDataSource, UITableViewDelegate
extension IsInvitingTableViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.isInvitingMemberData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.hiddenSections.contains(section) {
            return 0
        }
        
        return self.isInvitingMemberData[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: IsInvitingTableViewCell.reuseID, for: indexPath) as? IsInvitingTableViewCell else {
            fatalError()
        }
        cell.set(name: self.isInvitingMemberData[indexPath.section][indexPath.row].name)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        tag = section
        let containerView = UIView()
        let containerView2 = IsInvitingCellView(name: firstInvitation.name)
        containerView.addSubview(containerView2)
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.hideSection))
        containerView2.addGestureRecognizer(tap)
        NSLayoutConstraint.activate([
            containerView2.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 32),
            containerView2.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -32),
            containerView2.heightAnchor.constraint(equalToConstant: 70),
            containerView2.centerXAnchor.constraint(equalTo: containerView.centerXAnchor)
        ])
        
        return containerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
