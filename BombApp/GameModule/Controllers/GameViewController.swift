import UIKit

class GameViewController: UIViewController {
    
    private let mainViewController = MainViewController()
    private let questLogic = QuestLogic()
    private var isStartButtonPressed: Bool = false
    let gameStartView = GameStartView()
    var questModel = QuestModel()
    
    var isContinueButtonPressed: Bool = false
    var isPlayMusic = true
    var currentQuestion: String = ""
    
    
    var timer: Timer?
    var count = 15
    
    
    private var passedSeconds = 0
    var isPaused = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        setConstraints()
        setupNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.rightBarButtonItem?.isEnabled = isContinueButtonPressed
        isPlayMusic = UserDefaults.standard.bool(forKey: "gameWithMusic") as! Bool
        let gameTime = UserDefaults.standard.integer(forKey: "GameTime")
        count = gameTime > 0 ? gameTime : 15
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        currentQuestion = UserDefaults.standard.string(forKey: "CurrentQuestion") as! String
    }
    
    private func updateUI() {
        addGradientBackground(topColor: UIColor.yellow, bottomColor: UIColor.orange)
        view.addSubview(gameStartView)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        questLogic.pauseSounds()
        UserDefaults.standard.set(count, forKey: "SecondsCount")
    }
    
    private func setupNavigationBar() {
        createCustomNavigationBar()
        let sceneTitleView = createCustomTitleView(sceneTitle: "Игра")
        let gameStopButton = createCustomButton(selector: #selector(stopOrResumeGame))
        navigationItem.titleView = sceneTitleView
        navigationItem.rightBarButtonItems = [gameStopButton]
    }

    
    
    @objc func stopOrResumeGame() {
        if isPaused {
            timer?.invalidate()
            questLogic.pauseSounds()
            questModel.stopAnimationView()
            isPaused = false
            gameStartView.gameLabel.text = "Пауза"
        } else {
            createTimer()
            let currentQuestionInGame = UserDefaults.standard.string(forKey: "CurrentQuestion") as! String
            currentQuestion = currentQuestionInGame
            gameStartView.gameLabel.text = currentQuestion
            
            isPaused = true
            if isPlayMusic{
                questLogic.playBackgroundSound()
            }
            gameStartView.startButton.isHidden = true
            gameStartView.bombImageView.isHidden = true
            questModel.playAnimationView()
            addAnimationViewOnScreen()
        }
    }
    
    @objc func startButtonPressed() {
        UserDefaults.standard.set(true, forKey: "IsThereActivePlay")
        isStartButtonPressed = true
        navigationItem.rightBarButtonItem?.isEnabled = true
        gameStartView.startButton.isHidden = true
        gameStartView.gameLabel.text = currentQuestion
        if gameStartView.startButton.isHidden {
            gameStartView.bombImageView.isHidden = true
            let sceneTitleView = createCustomTitleView(sceneTitle: "Игра")
            let gameStopButton = createCustomButton(selector: #selector(stopOrResumeGame))
            navigationItem.titleView = sceneTitleView
            navigationItem.rightBarButtonItems = [gameStopButton]
            questModel.createAnimationView()
            addAnimationViewOnScreen()
            createTimer()
            if isPlayMusic{
                questLogic.playBackgroundSound()
            }

        }
        
    }
        
    func createTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
        
    @objc private func updateTimer() {
        if count != 0 {
            count -= 1
            print(count)
            passedSeconds += 1
        } else {
            timer?.invalidate()
            questLogic.stopSounds()
            navigationController?.pushViewController(GameEndViewController(), animated: true)
            questModel.stopAnimationView()
            deleteAnimationView()
            if isPlayMusic{
                questLogic.playBlastSound()
            }
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
        
    public func addAnimationViewOnScreen() {
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
            gameStartView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        ])
    }
}
