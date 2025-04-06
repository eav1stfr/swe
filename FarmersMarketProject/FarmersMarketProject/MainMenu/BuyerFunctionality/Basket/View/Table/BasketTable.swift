import UIKit

final class BasketTableView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var tableView = UITableView()
    
    private var products: [BasketProductModel] = [
        BasketProductModel(productName: "Banana", productPrice: "100", productQuantity: "123", farmerName: "rimma123")
    ]
}

extension BasketTableView {
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        addSubviews()
        setupConstraints()
        
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
    
    private func additionalSetup() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(BasketTableViewCustomCell.self, forCellReuseIdentifier: "BasketCC")
    }
}

extension BasketTableView: UITableViewDelegate {
    
}

extension BasketTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let customCell = tableView.dequeueReusableCell(
            withIdentifier: "BasketCC",
            for: indexPath
        ) as? BasketTableViewCustomCell else {
            return UITableViewCell()
        }
        customCell.set(cell: products[indexPath.row])
        return customCell
    }
}
