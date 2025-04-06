import UIKit

struct Product {
    let name: String
    let category: String
    let price: Int
    let quantity: Int
    let farmLocation: String
    let description: String
}

class ProductData {
    func getProducts() -> [Product] {
        return [
            Product(
                name: "Fresh Strawberries",
                category: "Fruits",
                price: 2000,
                quantity: 100,
                farmLocation: "Green Fields",
                description: "Sweet and organic strawberries"
            ),
            Product(
                name: "Fresh Strawberries",
                category: "Fruits",
                price: 2500,
                quantity: 80,
                farmLocation: "Berry Farm",
                description: "Ripe strawberries picked at peak freshness"
            ),
            Product(
                name: "Organic Kale",
                category: "Vegetables",
                price: 3000,
                quantity: 50,
                farmLocation: "Green Fields",
                description: "Healthy and fresh kale, grown without pesticides"
            ),
            Product(
                name: "Organic Kale",
                category: "Vegetables",
                price: 2900,
                quantity: 60,
                farmLocation: "Healthy Harvest",
                description: "Crisp and vibrant organic kale"
            ),
            Product(
                name: "Yellow Corn",
                category: "Vegetables",
                price: 1500,
                quantity: 300,
                farmLocation: "Sunny Acres",
                description: "Sweet yellow corn, perfect for summer BBQs"
            ),
            Product(
                name: "Yellow Corn",
                category: "Vegetables",
                price: 1000,
                quantity: 250,
                farmLocation: "Corn Valley",
                description: "Juicy and fresh yellow corn"
            ),
            Product(
                name: "Honeycrisp Apples",
                category: "Fruits",
                price: 4000,
                quantity: 150,
                farmLocation: "Apple Orchard",
                description: "Crisp and sweet Honeycrisp apples"
            ),
            Product(
                name: "Honeycrisp Apples",
                category: "Fruits",
                price: 4700,
                quantity: 120,
                farmLocation: "Orchard Grove",
                description: "Juicy and flavorful Honeycrisp apples"
            ),
            Product(
                name: "Sweet Potatoes",
                category: "Vegetables",
                price: 2600,
                quantity: 200,
                farmLocation: "Root Farms",
                description: "Nutritious and delicious sweet potatoes"
            ),
            Product(
                name: "Sweet Potatoes",
                category: "Vegetables",
                price: 5600,
                quantity: 220,
                farmLocation: "Harvest Hill",
                description: "Freshly harvested sweet potatoes"
            )
        ]
    }
}


class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    let searchBar = UISearchBar()
    let tableView = UITableView()
    var viewModel = SearchViewModel(productData: ProductData())

    // Define the Price Button
    let priceButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Price", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupSearchBar()
        setupTableView()
        setupPriceButton() // Setup the price button
        
        // Register the UITableViewCell
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.reloadData()
    }

    func setupSearchBar() {
        searchBar.delegate = self
        searchBar.placeholder = "Search here"
        searchBar.sizeToFit()
        navigationItem.titleView = searchBar
        view.addSubview(searchBar)
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.topAnchor),
            searchBar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }

    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    func setupPriceButton() {
        view.addSubview(priceButton)

        // Set up constraints for the Price button at the bottom
        NSLayoutConstraint.activate([
            priceButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            priceButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        // Add action to the Price button
        priceButton.addTarget(self, action: #selector(openPriceFilter), for: .touchUpInside)
    }

    @objc func openPriceFilter() {
        let priceFilterVC = PriceFilterViewController()
        priceFilterVC.onApply = { [weak self] minPrice, maxPrice in
            self?.viewModel.filterByPrice(minPrice: minPrice, maxPrice: maxPrice)
            self?.tableView.reloadData()
        }
        present(priceFilterVC, animated: true, completion: nil)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.filteredItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let item = viewModel.filteredItems[indexPath.row]
        cell.textLabel?.text = "\(item.name) - Price: \(item.price)" // Display name and price together
        return cell
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.filterResults(searchText: searchText)
        tableView.reloadData()
    }
}

