import UIKit

final class ProductListingView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let tableView = UITableView()
    
    private var tableCells: [TableProductListingCellModel] = []
}

extension ProductListingView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableCells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let customCell = tableView.dequeueReusableCell(
            withIdentifier: "TablePLCustomCell",
            for: indexPath
        ) as? ProductListingTableCustomCell else {
            return UITableViewCell()
        }
        customCell.set(cellModel: tableCells[indexPath.row])
        return customCell
    }
}

extension ProductListingView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableCells.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            print("started delete process")
            
            let url = URL(string: "https://farmer-market-zlmy.onrender.com/api/my-products/")!
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            
            request.setValue(
                "application/json",
                forHTTPHeaderField: "Content-Type"
            )
            
            let defaults = UserDefaults.standard
            if let token = defaults.string(forKey: "UserToken") {
                request.setValue("token \(token)", forHTTPHeaderField: "Authorization")
            } else {
                print("error: something went wrong")
                return
            }
        }
    }
}

extension ProductListingView {
    func configure(cellList: [TableProductListingCellModel]) {
        self.tableCells = cellList
        tableView.reloadData()
    }
}

private extension ProductListingView {
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemMint
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
    
    private func addSubviewsStyle() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ProductListingTableCustomCell.self, forCellReuseIdentifier: "TablePLCustomCell")
    }
}

