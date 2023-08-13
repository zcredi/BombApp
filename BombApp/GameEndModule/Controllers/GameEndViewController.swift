import UIKit

class GameEndViewController: UIViewController {
    
    private var penalties = Question()
    private lazy var gameEndView = GameEndView(showQuest: showQuest)
    private var showQuest = false
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        showQuest = UserDefaults.standard.bool(forKey: "gameWithChallenge") as! Bool
        updateUI()
        setConstraints()
        setupNavigationBar()
        penalties.generatePunishments()
        nextQuestButtonPressed()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
    }
    
    private func updateUI() {
        addGradientBackground(topColor: UIColor.yellow, bottomColor: UIColor.orange)
        view.addSubview(gameEndView)
    }
    
    private func setupNavigationBar() {
        let categoreView = UILabel()
        categoreView.text = "Игра"
        categoreView.textColor = .purpleColor
        categoreView.font = UIFont(name: "DelaGothicOne-Regular", size: 30)
        self.navigationItem.titleView = categoreView
        let gameStopButton = createCustomButton(selector: #selector(stopOrResumeGame))
    }
    
    @objc func stopOrResumeGame() {
        print("Game stop/resume")
    }
    
    @objc func nextQuestButtonPressed() {
        gameEndView.questLabel.text = penalties.getRandomPunishments()
    }
    
    @objc func repeatButtonPressed(_ sender: UIButton) {
        let vc = MainViewController()
        self.navigationController?.setViewControllers([vc], animated: false)
    }
}

extension GameEndViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            gameEndView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            gameEndView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            gameEndView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            gameEndView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
        ])
    }
}
