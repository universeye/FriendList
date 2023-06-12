//
//  CustumSegmentedControl.swift
//  FriendList
//
//  Created by Terry Kuo on 2023/6/10.
//

import UIKit

protocol CustumSegmentedControlDelegate: AnyObject {
    func chageToIndex(index: Int)
}

class CustumSegmentedControl: UIView {

    private var buttonTitles: [String]!
    private var buttons: [UIButton]!
    private var selectorView: UIView!
    var unreadCount = UnreadCountLabel()
    var isInvitingCount = UnreadCountLabel()
    private var textColor: UIColor = FriendListColor.greyishBrown
    private var selectorViewColor: UIColor = FriendListColor.hotPink
    private var selectorTextColor: UIColor = .black
    weak var delegte: CustumSegmentedControlDelegate?
    private var _selectedIndex: Int = 0
    public var selectedIndex: Int {
        return _selectedIndex
    }
    
    convenience init(frame: CGRect, buttonTitle: [String]) {
        self.init(frame: frame)
        self.buttonTitles = buttonTitle
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        updateView()
    }
    
    func setButtonTitles(buttonTitle: [String]) {
        self.buttonTitles = buttonTitle
        updateView()
    }
    
    func setUnreadCount(isInvitingCount: Int, isShowUnreadCount: Bool) {
        if isInvitingCount - 1 > 0 {
            self.isInvitingCount.isHidden = false
            self.isInvitingCount.text = "\(isInvitingCount)"
        } else {
            self.isInvitingCount.isHidden = true
        }
        
        self.unreadCount.isHidden = !isShowUnreadCount
        
    }
    
    private func configureStackView() {
        let stackView = UIStackView(arrangedSubviews: buttons ?? [])
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leftAnchor.constraint(equalTo: leftAnchor),
            stackView.rightAnchor.constraint(equalTo: rightAnchor)
        ])
    }
    
    private func configSelectorView() {
        let selectorWidth = (frame.width / CGFloat(self.buttonTitles.count)) - 50
        let selectorHeight = frame.height
        let selectedPosition = (frame.width / CGFloat(buttonTitles.count) * CGFloat(selectedIndex)) + ((frame.width / CGFloat(buttonTitles.count) / 3 ))
        selectorView = UIView(frame: CGRect(origin: CGPoint(x: selectedPosition, y: selectorHeight - 2), size: CGSize(width: selectorWidth, height: 5)))
        selectorView.layer.cornerRadius = selectorView.frame.height / 2
        selectorView.backgroundColor = selectorViewColor
        
        addSubview(selectorView)
        bringSubviewToFront(selectorView)
    }
    
    private func createButton() {
        buttons = [UIButton]()
        buttons.removeAll()
        subviews.forEach { $0.removeFromSuperview() }
        for buttonTitle in buttonTitles {
            let button = UIButton(type: .system)
            button.setTitle(buttonTitle, for: .normal)
            
            button.layer.cornerRadius = 20
            button.addTarget(self, action: #selector(Self.buttonAction(sender:)), for: .touchUpInside)
            button.setTitleColor(textColor, for: .normal)
            buttons.append(button)
        }
        buttons[0].setTitleColor(selectorTextColor, for: .normal)
    }
    
    @objc private func buttonAction(sender: UIButton) {
        for (buttonIndex, btn) in buttons.enumerated() {
            btn.setTitleColor(textColor, for: .normal)
            if btn == sender {
                let selectedPosition = (frame.width / CGFloat(buttonTitles.count) * CGFloat(buttonIndex)) + ((frame.width / CGFloat(buttonTitles.count) / 3 ))
                delegte?.chageToIndex(index: buttonIndex)
                UIView.animate(withDuration: 0.3) {
                    self.selectorView.frame.origin.x = selectedPosition
                }
                btn.setTitleColor(selectorTextColor, for: .normal)
            }
        }
    }
    
    func setIndex(index: Int) {
        buttons.forEach { $0.setTitleColor(textColor, for: .normal) }
        let button = buttons[index]
        _selectedIndex = index
        button.setTitleColor(selectorTextColor, for: .normal)
        let selectorPosotion = frame.width / CGFloat(buttonTitles.count) * CGFloat(index) + ((frame.width / CGFloat(buttonTitles.count) / 3 ))
        UIView.animate(withDuration: 0.2) {
            self.selectorView.frame.origin.x = selectorPosotion
        }
    }
    
    private func configureUnreadCountText() {
        buttons[1].addSubview(unreadCount)
        unreadCount.text = "99+"
        
        NSLayoutConstraint.activate([
            unreadCount.leadingAnchor.constraint(equalTo: buttons[1].titleLabel!.trailingAnchor, constant: 4),
            unreadCount.centerYAnchor.constraint(equalTo: buttons[1].centerYAnchor, constant: -8),
            unreadCount.widthAnchor.constraint(equalToConstant: 30),
            unreadCount.heightAnchor.constraint(equalToConstant: 19)
        ])
    }
    
    private func configureIsInvitingCount() {
        buttons[0].addSubview(isInvitingCount)
        
        NSLayoutConstraint.activate([
            isInvitingCount.leadingAnchor.constraint(equalTo: buttons[0].titleLabel!.trailingAnchor, constant: 4),
            isInvitingCount.centerYAnchor.constraint(equalTo: buttons[0].centerYAnchor, constant: -8),
            isInvitingCount.widthAnchor.constraint(equalToConstant: 20),
            isInvitingCount.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    private func updateView() {
        createButton()
        configSelectorView()
        configureStackView()
        configureUnreadCountText()
        configureIsInvitingCount()
    }
}
