//
//  UIViewController + Ext.swift
//  FriendList
//
//  Created by Terry Kuo on 2023/6/9.
//

import UIKit

fileprivate var containerView: UIView!

extension UIViewController {
    func showLoadingView() {
        containerView = UIView(frame: .zero)
        view.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 140),
            containerView.heightAnchor.constraint(equalToConstant: 140)
        ])
        containerView.layer.cornerRadius = 20
        containerView.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        containerView.alpha = 0
        
        UIView.animate(withDuration: 0.25) {
            containerView.alpha = 0.8
        }
        
        let dotsAnimationView = DotsAnimationView(dotSize: .init(width: 10, height: 10), dotColor: .white, animationTime: 0.9)
        dotsAnimationView.startAnimation()
        containerView.addSubview(dotsAnimationView)
        
        dotsAnimationView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            dotsAnimationView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            dotsAnimationView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor)
        ])
    }
    
    func dimissLoadingView() {
        DispatchQueue.main.async {
            if containerView != nil {
                containerView.removeFromSuperview()
                containerView = nil
            }
        }
    }
    
    func add(_ child: UIViewController, in view: UIView) {
        addChild(child)
        view.addSubview(child.view)
        child.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            child.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            child.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            child.view.topAnchor.constraint(equalTo: view.topAnchor),
            child.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        child.didMove(toParent: self)
    }
    
    
}
