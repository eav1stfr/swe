import UIKit

final class ProductListingViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        parseJSON()
        setupView()
    }
    
    private let productListingLabel: UILabel = {
        let label = UILabel()
        label.text = "Product Listing"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 25, weight: .heavy)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var productListingView = ProductListingView()
    
    private var myProductsList: [TableProductListingCellModel] = []
}

private extension ProductListingViewController {
    private func parseJSON() {
        print("started parsing json, retreiving product list of certain farmer")
        
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
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if error != nil {
                print("ERROR IS NOT NIL")
                return
            }
            
            guard let safeData = data else {
                print("no data received")
                return
            }
            
            do {
                let product = try JSONDecoder().decode([TableProductListingCellModel].self, from: safeData)
                DispatchQueue.main.async {
                    self.myProductsList = product
                    print("products successfully retreived from safe dataa eeeeee")
                    self.productListingView.configure(cellList: self.myProductsList)
                    print(self.myProductsList)
                }
            } catch {
                print("got some error \(error)")
                return
            }
        }
        task.resume()
    }
}

private extension ProductListingViewController {
    private func setupView() {
        view.backgroundColor = .white
        addSubviews()
        setupConstraints()
        productListingView.configure(cellList: myProductsList)
    }
    
    private func addSubviews() {
        view.addSubview(productListingLabel)
        view.addSubview(productListingView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            productListingLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 63),
            productListingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            productListingView.topAnchor.constraint(equalTo: productListingLabel.bottomAnchor, constant: 20),
            productListingView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            productListingView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            productListingView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}
