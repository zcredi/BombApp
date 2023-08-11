import UIKit



class CategoryViewController: UIViewController {
    var question = Question()
   
    private let text: [String] = ["О Разном", "Спорт и Хобби", "Про Жизнь", "Знаменитости", "Исскуство и Кино", "Природа"]
    private let image: [UIImage] = [UIImage(named: "image1")!, UIImage(named: "image2")!, UIImage(named: "image3")!, UIImage(named: "image4")!, UIImage(named: "image5")!, UIImage(named: "image6")!]
    private var selectedItems: [String] = []
    private var isSelected: Bool = false
    
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
  
    private var collectionViewWidth: CGFloat {
        return view.bounds.width
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addGradientBackground(topColor: UIColor.yellow, bottomColor: UIColor.orange)
        createCustomNavigationBar()
        let sceneTitleView = createCustomTitleView(sceneTitle: "Игра")
        self.navigationItem.titleView = sceneTitleView
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        question.generateQuestions()
        question.generatePunishments()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        makeConstraints()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let savedCategories = UserDefaults.standard.array(forKey: "selectedCategories") as? [String] {
            selectedItems = savedCategories
        }
        collectionView.reloadData()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        let selectedCategories = selectedItems
        UserDefaults.standard.set(selectedCategories, forKey: "selectedCategories")
    }

    @IBAction func backButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    private func makeConstraints() {
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
        ])
    }
}

extension CategoryViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return text.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath) as! MyCollectionViewCell
        let category = text[indexPath.row]
        cell.delegate = self
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.blackColor.cgColor
        cell.backgroundColor = UIColor(red: 129 / 255, green: 48 / 255, blue: 167 / 255, alpha: 1)
        cell.configure(with: image[indexPath.row], title: category)
        cell.selectButton.tag = indexPath.row
        cell.layer.cornerRadius = 50
        cell.layer.masksToBounds = true
        if selectedItems.contains(category) {
            cell.setSelectionState(isSelected: true)
        } else {
            cell.setSelectionState(isSelected: false)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let currentCell = collectionView.cellForItem(at: indexPath) as! MyCollectionViewCell
        currentCell.toggleSelectionState()
    }
}

extension CategoryViewController: MyCollectionViewCellDelegate {
    func didSelectItem(_ button: UIButton) {
        let configuration = UIImage.SymbolConfiguration(pointSize: 24, weight: .regular)
        let category = text[button.tag]
        let imageCircle = UIImage(systemName: "circle.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        let checkmark = UIImage(systemName: "checkmark.circle.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        selectedItems.contains(category) ? button.setImage(imageCircle?.withConfiguration(configuration), for: .normal) : button.setImage(checkmark?.withConfiguration(configuration), for: .normal)
        selectedItems.contains(category) ? selectedItems.removeAll { $0 == category } : selectedItems.append(category)
    }
}
