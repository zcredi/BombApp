//
//  Extension + UIViewController.swift
//  BombApp
//
//  Created by Daria Arisova on 09.08.2023.
//

import UIKit

extension UIViewController {
    
    func createCustomNavigationBar() {
        
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.tintColor = UIColor(red: 0.05, green: 0.05, blue: 0.05, alpha: 1.00)
        navigationController?.navigationBar.topItem?.title = " " //some kind of magic remove back arrow btn title O_o
    }
    
    func createCustomTitleView(sceneTitle: String) -> UIView {
        
        let view = UIView()
//        view.frame = CGRect(x: 0, y: 0, width: 280, height: 41)
        let sceneTitleLabel = UILabel(
            text: sceneTitle,
            font: UIFont.delaGothicOneRegular30()!,
            color: .purpleColor
        )
        
        view.addSubview(sceneTitleLabel)
        NSLayoutConstraint.activate([
            sceneTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sceneTitleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        return view
    }
    
    func createCustomButton(selector: Selector) -> UIBarButtonItem {
        let stopButton = StopButton()
        stopButton.addTarget(self, action: selector, for: .touchUpInside)
        
        let menuBarItem = UIBarButtonItem(customView: stopButton)
        
        return menuBarItem
    }
}
