import UIKit

class CategoryViewController: UIViewController {
   
    private let text: [String] = ["О Разном", "Спорт и Хобби", "Про Жизнь", "Знаменитости", "Исскуство и Кино", "Природа"]
    private let image: [UIImage] = [UIImage(named: "image1")!, UIImage(named: "image2")!, UIImage(named: "image3")!, UIImage(named: "image4")!, UIImage(named: "image5")!, UIImage(named: "image6")!]
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (collectionViewWidth - 20) / 2, height: (collectionViewWidth - 30) / 2)
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5) // отступы для крайних ячеек

        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
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
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        makeConstraints()
    }
    
    private func makeConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -90),
        ])
    }
}

extension CategoryViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return text.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath) as! MyCollectionViewCell
        cell.backgroundColor = UIColor(red: 129 / 255, green: 48 / 255, blue: 167 / 255, alpha: 1)
        cell.configure(with: image[indexPath.row], title: text[indexPath.row])
        cell.layer.cornerRadius = 50
        return cell
    }
}
