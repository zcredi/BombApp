import UIKit

class CategoryViewController: UIViewController, MyCollectionViewCellDelegate {
    private var isSelected: Bool = false
    
    func didSelectItem(_ button: UIButton) {
        let configuration = UIImage.SymbolConfiguration(pointSize: 24, weight: .regular)
        let imageCircle = UIImage(systemName: "circle.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        let checkmark = UIImage(systemName: "checkmark.circle.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        isSelected ? button.setImage(imageCircle?.withConfiguration(configuration), for: .normal) : button.setImage(checkmark?.withConfiguration(configuration), for: .normal)
        isSelected.toggle()
        isSelected ? selectedItems.append(text[button.tag]) : selectedItems.removeAll { $0 == text[button.tag] }
    }
    
    private let text: [String] = ["О Разном", "Спорт и Хобби", "Про Жизнь", "Знаменитости", "Исскуство и Кино", "Природа"]
    private let image: [UIImage] = [UIImage(named: "image1")!, UIImage(named: "image2")!, UIImage(named: "image3")!, UIImage(named: "image4")!, UIImage(named: "image5")!, UIImage(named: "image6")!]
    private var selectedItems: [String] = []
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (collectionViewWidth - 20) / 2, height: (collectionViewWidth - 30) / 2)
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)

        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.isUserInteractionEnabled = true
        cv.isScrollEnabled = false
        cv.backgroundColor = .clear
        cv.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    public lazy var startButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.blackColor.cgColor
        button.titleLabel?.font = UIFont.delaGothicOneRegular24()
        button.tintColor = .yellowColor
        button.backgroundColor = .purpleColor
        button.layer.cornerRadius = 40
        button.setTitle("Начать игру", for: .normal)
        button.addTarget(self, action: #selector(touchDown), for: .touchDown)
        button.addTarget(self, action: #selector(touchUpInside), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var collectionViewWidth: CGFloat {
        return view.bounds.width
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backChevron = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: nil)
        backChevron.tintColor = .blackColor
        let categoreView = UILabel()
        categoreView.text = "Категории"
        categoreView.textColor = .purpleColor
        categoreView.font = UIFont(name: "DelaGothicOne-Regular", size: 30)
        
        self.navigationItem.titleView = categoreView
        navigationItem.leftBarButtonItem = backChevron
        addGradientBackground(topColor: UIColor.yellow, bottomColor: UIColor.orange)
        categoreView.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        Quiestion.generateQuestions()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        makeConstraints()
    }

    @IBAction func touchDown(sender: UIButton) {
        UIView.animate(withDuration: 0.5, delay: 0, options: [.allowUserInteraction, .beginFromCurrentState]) {
            sender.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }
    }
    
    @IBAction func touchUpInside(sender: UIButton) {
        UIView.animate(withDuration: 0.5, delay: 0, options: [.allowUserInteraction, .beginFromCurrentState]) {
            sender.transform = .identity
        }
        if selectedItems.count == 0 {
            let alertController = CustomAlertController(image: UIImage(named: "applicationLogo") ?? .add, title: "Ошибка", message: "Выберите минимум одну категорию для начала игры")
            alertController.modalPresentationStyle = .overCurrentContext
            alertController.modalTransitionStyle = .crossDissolve
            self.present(alertController, animated: true)
        }
    }
    
    private func makeConstraints() {
        view.addSubview(collectionView)
        view.addSubview(startButton)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            
            startButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            startButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            startButton.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
}

extension CategoryViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return text.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath) as! MyCollectionViewCell
        cell.delegate = self
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.blackColor.cgColor
        cell.backgroundColor = UIColor(red: 129 / 255, green: 48 / 255, blue: 167 / 255, alpha: 1)
        cell.configure(with: image[indexPath.row], title: text[indexPath.row])
        cell.selectButton.tag = indexPath.row
        cell.layer.cornerRadius = 50
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let currentCell = collectionView.cellForItem(at: indexPath) as! MyCollectionViewCell
        currentCell.toggleSelectionState()
    }
}
