import UIKit



final class FarmersLitsView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let tableView = UITableView()
    
    private var farmersList: [FarmerSellingProduct] = []
}

extension FarmersLitsView: UITableViewDelegate {
    
}

extension FarmersLitsView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return farmersList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let customCell = tableView.dequeueReusableCell(
            withIdentifier: "BasketProductCell",
            for: indexPath
        ) as? FarmersListCustomCell else {
            return UITableViewCell()
        }
        customCell.set(cell: farmersList[indexPath.row])
        return customCell
    }
}

extension FarmersLitsView {
    
    private func setupView() {
        backgroundColor = .systemCyan
        translatesAutoresizingMaskIntoConstraints = false
        addSubviews()
        setupConstraints()
        addSubviewsStyle()
    }
    
    private func addSubviews() {
        addSubview(tableView)
    }
    
    private func setupConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func configure(cellList: [FarmerSellingProduct]) {
        self.farmersList = cellList
        tableView.reloadData()
    }
    
    private func addSubviewsStyle() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(FarmersListCustomCell.self, forCellReuseIdentifier: "BasketProductCell")
    }
}
