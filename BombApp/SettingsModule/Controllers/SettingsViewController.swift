//
//  SettingsViewController.swift
//  BombApp
//
//  Created by Владислав on 08.08.2023.
//

import UIKit

class SettingsViewController: UIViewController {
    enum Constants {
        static let titleLabelTopSpacing: CGFloat = 0.0
        static let titleLabelleadingSpacing: CGFloat = 93.0
    }
    
    //MARK: - Create UI
    
    private lazy var titleLabel = UILabel(text: "Настройки", font: .delaGothicOneRegular30(), color: .purpleColor)
    
    private lazy var timeGameView = TimeGameView()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        addGradientBackground(topColor: UIColor.yellow, bottomColor: UIColor.orange)
        view.addSubview(titleLabel)
        view.addSubview(timeGameView)
    }
    
}

//MARK: - setConstraints

extension SettingsViewController {
    private func setConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constants.titleLabelTopSpacing),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.titleLabelleadingSpacing),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        timeGameView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            timeGameView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            timeGameView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 2),
            timeGameView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            timeGameView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
}
