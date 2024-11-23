import UIKit

final class BasketProductFarmersListViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        //parseJSON(with: "https://farmer-market-zlmy.onrender.com/api/products/" + String(dict["Banana"]!) + "/")
        setupView()
    }
    
    private let dict: Dictionary<String, Int> = ["Banana": 1, "Apple": 3, "Orange":4, "Grape": 5, "Mango": 6, "Carrot": 7, "Potato": 8, "Onion": 9, "Cucumber": 10, "Pepper": 11, "Button Mushroom": 12, "Portobello": 13, "Shiitake": 14, "Chantereller": 15, "Enoki": 16, "Milk": 17, "Cheese": 18, "Butter": 19, "Yogurt": 20, "Cream": 21, "Oatmeal": 22]
    
    private lazy var tap = UITapGestureRecognizer(target: self, action: #selector(UIView.endEditing))

    private var productName: String = ""
    
    private let searchTextfield = TextFieldView(placeH: "Search", width: 300)
    
    private let productNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Product"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
        label.textAlignment = .left
        return label
    }()
    
    private var availableFarmersSellingProduct: [FarmerSellingProduct] = []
    
    private var availableFarmersTableView = FarmersLitsView()
    
}

private extension BasketProductFarmersListViewController {
    
    private func setupView() {
        view.backgroundColor = .white
        searchTextfield.delegate = self
        addSubviews()
        setupConstraints()
    }
    
    private func addSubviews() {
        //view.addGestureRecognizer(tap)
        
        view.addSubview(productNameLabel)
        view.addSubview(searchTextfield)
        view.addSubview(availableFarmersTableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            productNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 63),
            productNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            searchTextfield.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor, constant: 20),
            searchTextfield.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            availableFarmersTableView.topAnchor.constraint(equalTo: searchTextfield.bottomAnchor, constant: 20),
            availableFarmersTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            availableFarmersTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            availableFarmersTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func updateLabels() {
        
    }
    
}

private extension BasketProductFarmersListViewController {
    
    private func parseJSON(with url: String) {
        print("started parsing JSON")
        
        let url = URL(string: url)!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) {data, response, error in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            
            guard let safeData = data else {
                print("no data received")
                return
            }
            
            do {
                let productList = try JSONDecoder().decode(FarmerSellingProductJSON.self, from: safeData)
                DispatchQueue.main.async {
                    self.availableFarmersSellingProduct = productList.farmer_products
                    self.availableFarmersTableView.configure(cellList: self.availableFarmersSellingProduct)
                    self.availableFarmersTableView.tableView.reloadData()
                    print(productList)
                }
            } catch {
                print("got unexpected error: \(error)")
                return
            }
        }
        task.resume()
    }
    
}

extension BasketProductFarmersListViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextfield.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if searchTextfield.text != "" {
            return true
        } else {
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let name = searchTextfield.text {
            if dict.keys.contains(name) {
                let url = "https://farmer-market-zlmy.onrender.com/api/products/" + String(dict[name]!) + "/"
                parseJSON(with: url)
            }
        }
        searchTextfield.text = ""
    }
}
