import UIKit

final class ProductListingViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private let productListingLabel: UILabel = {
        let label = UILabel()
        label.text = "Product Listing"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var productListingView = ProductListingView()
    
    private var myProductsList: [TableProductListingCellModel] = []
}

private extension ProductListingViewController {
    private func parseJSON() {
        let defaults = UserDefaults.standard
        
        let url = URL(string: "https://farmer-market-zlmy.onrender.com/api/my-products/")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if let token = UserDefaults.standard.string(forKey: "UserToken") {
            request.setValue("token \(token)", forHTTPHeaderField: "Authorization")
        } else {
            print("error: something went wrong")
            return
        }
        
        //let session = URLSession(configuration: .default)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if error != nil {
                print("ERROR IS NOT NIL")
                return
            }
            
            if let safeData = data {
                let products = try JSONDecoder().decode([TableProductListingCellModel].self, from: safeData)
                DispatchQueue.main.async {
                    self.myProductsList = products
                    print("Products successfully fetched: \(self.myProductsList)")
                }
            }
        }
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
            productListingLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            productListingLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            
            productListingView.topAnchor.constraint(equalTo: productListingLabel.bottomAnchor, constant: 20),
            productListingView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            productListingView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            productListingView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}
