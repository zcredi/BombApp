//
//  RulesViewController.swift
//  BombApp
//
//  Created by Владислав on 07.08.2023.
//

import UIKit

class RulesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        createCustomNavigationBar()
        
        let sceneTitleView = createCustomTitleView(sceneTitle: "Помощь")
        navigationItem.titleView = sceneTitleView
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
