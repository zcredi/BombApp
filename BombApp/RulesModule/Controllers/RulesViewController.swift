import UIKit

class RulesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
//    private let rulesView = RulesView()
//    private let categoryRulesView = CategoryRulesView()
    private let arrayOfViews = [RulesView(), CategoryRulesView()]
    private var myTableView = UITableView()
    let identifireForViews = "MyCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        setConstraints()
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        createCustomNavigationBar()
        
        let sceneTitleView = createCustomTitleView(sceneTitle: "Помощь")
        navigationItem.titleView = sceneTitleView
    }
    
    private func updateUI() {
        addGradientBackground(topColor: UIColor.yellow, bottomColor: UIColor.orange)
        createTableView()
    }
    
    private func createTableView() {
        self.myTableView = UITableView(frame: view.bounds, style: .plain)
        myTableView.backgroundColor = .clear
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: identifireForViews)
        myTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
//        myTableView.isPagingEnabled = true
        
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        
        myTableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        view.addSubview(myTableView)
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrayOfViews.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifireForViews, for: indexPath)
        let viewToAdd = arrayOfViews[indexPath.section]
        cell.backgroundColor = .clear
        cell.contentView.backgroundColor = .clear
        cell.contentView.addSubview(viewToAdd)
        NSLayoutConstraint.activate([
            viewToAdd.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 10),
            viewToAdd.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor, constant: -10),
            viewToAdd.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 10),
            viewToAdd.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -10),
        ])
        cell.isUserInteractionEnabled = false
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.bounds.height - 2 * (navigationController?.navigationBar.frame.height ?? 0.0)
    }
}

extension RulesViewController {
    private func setConstraints(){
        NSLayoutConstraint.activate([
//            arrayOfViews[0].topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 20),
//            arrayOfViews[0].bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -20),
//            arrayOfViews[0].leadingAnchor.constraint(equalTo: myTableView.leadingAnchor,constant: 0),
//            arrayOfViews[0].trailingAnchor.constraint(equalTo: myTableView.trailingAnchor,constant: 0)
        
        ])
    }
}
