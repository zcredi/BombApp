import UIKit

class CustomAlertController: UIViewController {
    
    init(image: UIImage, title: String?, message: String?) {
        self.image = image
        self.alertTitle = title
        self.alertMessage = message
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var image: UIImage
    var alertView: UIView!
    var separatorLine: UIView!
    
    // Элементы для вывода заголовка и сообщения
    var titleLabel: UILabel!
    var messageLabel: UILabel!
    
    // Кнопка для закрытия alert'а
    var closeButton: UIButton!
    
    var alertTitle: String? = "Title from alert"
    var alertMessage: String? = "That's a message from alert!"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBlurBackground()
        setupAlertView()
        setupTitleLabel()
        setupMessageLabel()
        setupSeparatorLine()
        setupCloseButton("Хорошо")
    }
    
    func setupBlurBackground() {
        let blurEffect = UIBlurEffect(style: .dark)
        let blurredEffectView = UIVisualEffectView(effect: blurEffect)
        blurredEffectView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(blurredEffectView)
        
        NSLayoutConstraint.activate([
            blurredEffectView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            blurredEffectView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            blurredEffectView.topAnchor.constraint(equalTo: view.topAnchor),
            blurredEffectView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func addAction(closure: (() -> ())?, title: String){
        setupCloseButton("Хорошо")
        closure?()
    }
    
    func setupAlertView() {
        alertView = UIView()
        alertView.translatesAutoresizingMaskIntoConstraints = false
        alertView.backgroundColor = .white
        alertView.layer.cornerRadius = 15
        view.addSubview(alertView)
        
        NSLayoutConstraint.activate([
            alertView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            alertView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            alertView.widthAnchor.constraint(equalToConstant: 250)
        ])

        let circleDiameter: CGFloat = 50.0
        let circleView = UIImageView(image: image)
        circleView.translatesAutoresizingMaskIntoConstraints = false
        circleView.layer.cornerRadius = circleDiameter / 2
        circleView.layer.masksToBounds = true
        
        alertView.addSubview(circleView)

        NSLayoutConstraint.activate([
            circleView.centerXAnchor.constraint(equalTo: alertView.centerXAnchor),
            circleView.topAnchor.constraint(equalTo: alertView.topAnchor, constant: -circleDiameter / 2),
            circleView.widthAnchor.constraint(equalToConstant: circleDiameter),
            circleView.heightAnchor.constraint(equalToConstant: circleDiameter)
        ])
    }

    func setupTitleLabel() {
        titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = alertTitle
        titleLabel.textAlignment = .center
        titleLabel.textColor = .black
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        alertView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: alertView.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: alertView.leadingAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: alertView.trailingAnchor, constant: -15)
        ])
    }

    func setupMessageLabel() {
        messageLabel = UILabel()
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.text = alertMessage
        messageLabel.numberOfLines = 0
        messageLabel.textColor = .black
        messageLabel.textAlignment = .center
        messageLabel.font = UIFont.systemFont(ofSize: 16)
        alertView.addSubview(messageLabel)

        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            messageLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            messageLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor)
        ])
    }
    
    func setupSeparatorLine() {
        separatorLine = UIView()
        separatorLine.translatesAutoresizingMaskIntoConstraints = false
        separatorLine.backgroundColor = .gray
        alertView.addSubview(separatorLine)

        NSLayoutConstraint.activate([
            separatorLine.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 10),
            separatorLine.leadingAnchor.constraint(equalTo: alertView.leadingAnchor),
            separatorLine.trailingAnchor.constraint(equalTo: alertView.trailingAnchor),
            separatorLine.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    func setupCloseButton(_ text: String) {
        closeButton = UIButton()
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.setTitle(text, for: .normal)
        closeButton.setTitleColor(.blue, for: .normal)
        closeButton.addTarget(self, action: #selector(dismissAlert), for: .touchUpInside)
        alertView.addSubview(closeButton)
        
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: separatorLine.bottomAnchor, constant: 5),
            closeButton.leadingAnchor.constraint(equalTo: alertView.leadingAnchor),
            closeButton.trailingAnchor.constraint(equalTo: alertView.trailingAnchor),
            closeButton.heightAnchor.constraint(equalToConstant: 40),
            closeButton.bottomAnchor.constraint(equalTo: alertView.bottomAnchor)
        ])
    }
    
    @objc func dismissAlert() {
        self.dismiss(animated: true, completion: nil)
    }
}
