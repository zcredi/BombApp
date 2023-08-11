import UIKit

class GameViewController: UIViewController {
    
    var question = Question()
    var arrayQuestions = [String]()
    private let gameStartView = GameStartView()
    private let questLogic = QuestLogic()
    private var questModel = QuestModel()
    private var currentQuestion: String = ""
    
    var timer: Timer?
    private var count = 5
    private var isPaused = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        setConstraints()
        setupNavigationBar()
        question.generateQuestions()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        arrayQuestions = UserDefaults.standard.array(forKey: "selectedCategories") as! [String]
        arrayQuestions = question.getCurrentCategory(category: arrayQuestions)
    }
    
    private func updateUI() {
        addGradientBackground(topColor: UIColor.yellow, bottomColor: UIColor.orange)
        view.addSubview(gameStartView)
    }
    
    private func setupNavigationBar() {
        createCustomNavigationBar()
        let sceneTitleView = createCustomTitleView(sceneTitle: "Игра")
        
        let gameStopButton = createCustomButton(selector: #selector(stopOrResumeGame))
        navigationItem.titleView = sceneTitleView
        navigationItem.rightBarButtonItems = [gameStopButton]
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    @objc func stopOrResumeGame() {
        print("Game stop/resume")
        if isPaused {
            timer?.invalidate()
            questLogic.pauseSounds()
            questModel.stopAnimationView()
            isPaused = false
            gameStartView.gameLabel.text = "Пауза"
        } else {
            createTimer()
            isPaused = true
            questLogic.playBackgroundSound()
            questModel.playAnimationView()
            addAnimationViewOnScreen()
            gameStartView.gameLabel.text = currentQuestion
        }
    }
    
    @objc func startButtonPressed() {
        print("button is hidden and title changed")
        gameStartView.startButton.isHidden = true
        
        currentQuestion = arrayQuestions.randomElement() ?? "None"
        gameStartView.gameLabel.text = currentQuestion
        if gameStartView.startButton.isHidden {
            gameStartView.bombImageView.isHidden = true
            
            questModel.createAnimationView()
            addAnimationViewOnScreen()
            
            createTimer()
            questLogic.playBackgroundSound()
        }
    }
    
    func createTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        print(count)
        if count != 0 {
            count -= 1
        } else {
            timer?.invalidate()
            questLogic.stopSounds()
            navigationController?.pushViewController(GameEndViewController(), animated: true)
            questModel.stopAnimationView()
            deleteAnimationView()
            questLogic.playBlastSound()
        }
    }
    
    private func deleteAnimationView() {
        let bombAnimationView = questModel.animationView
        bombAnimationView.removeFromSuperview()
        bombAnimationView.removeConstraints([
            bombAnimationView.trailingAnchor.constraint(equalTo: gameStartView.trailingAnchor, constant: -10),
            bombAnimationView.leadingAnchor.constraint(equalTo: gameStartView.leadingAnchor, constant: 10),
            bombAnimationView.centerXAnchor.constraint(equalTo: gameStartView.centerXAnchor),
            bombAnimationView.bottomAnchor.constraint(equalTo: gameStartView.startButton.topAnchor, constant: 60)
        ])
    }
    
    private func addAnimationViewOnScreen() {
        let bombView: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        gameStartView.addSubview(bombView)
        let bombAnimationView = questModel.animationView
        bombView.addSubview(bombAnimationView)
        
        NSLayoutConstraint.activate([
            bombAnimationView.trailingAnchor.constraint(equalTo: gameStartView.trailingAnchor, constant: -10),
            bombAnimationView.leadingAnchor.constraint(equalTo: gameStartView.leadingAnchor, constant: 10),
            bombAnimationView.centerXAnchor.constraint(equalTo: gameStartView.centerXAnchor),
            bombAnimationView.bottomAnchor.constraint(equalTo: gameStartView.startButton.topAnchor, constant: 60)
        ])
    }
}

extension GameViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
        
            gameStartView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            gameStartView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            gameStartView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            gameStartView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
        ])
    }
}
