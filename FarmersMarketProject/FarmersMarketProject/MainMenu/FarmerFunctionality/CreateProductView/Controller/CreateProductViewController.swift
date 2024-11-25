import UIKit

final class CreateProductViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private var createProductView = CreateProduct()
    
    private let createProductLabel: UILabel = {
        let label = UILabel()
        label.text = "Create Product"
        label.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
}

extension CreateProductViewController: CreateProductDelegate {
    func publish(product: ProductModel) {
        print("publish button pressed")
        let url = URL(string: "https://farmer-market-zlmy.onrender.com/api/my-products/create/")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let data = try! JSONEncoder().encode(product)
        request.httpBody = data
        
        request.setValue(
            "application/json",
            forHTTPHeaderField: "Content-Type"
        )
        
        if let token = UserDefaults.standard.string(forKey: "UserToken") {
            request.setValue("token \(token)", forHTTPHeaderField: "Authorization")
            print("TOKEN IS \(token)")
        } else {
            print("error: something went wrong")
            return
        }
    
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            let statusCode = (response as! HTTPURLResponse).statusCode
            print(statusCode)
            
            if statusCode == 400 {
                DispatchQueue.main.async {
                    let alertController = UIAlertController(
                        title: "Failure",
                        message: "Something went wrong. Try again!",
                        preferredStyle: .alert)
                    let action = UIAlertAction(title: "Try again", style: .default)
                    alertController.addAction(action)
                    self.present(alertController, animated: true)
                }
            } else if statusCode == 500 {
                print("mistake, 500")
            } else {
                DispatchQueue.main.async {
                    let alertController = UIAlertController(
                        title: "Success",
                        message: "Your product was added!",
                        preferredStyle: .alert)
                    let action = UIAlertAction(title: "Got it!", style: .default)
                    alertController.addAction(action)
                    self.present(alertController, animated: true)
                }
            }
        }
        task.resume()
    }
}



private extension CreateProductViewController {
    
    private func setupView() {
        createProductView.delegate = self
        view.backgroundColor = .white
        addSubviews()
        setupConstraints()
    }
    
    private func addSubviews() {
        view.addSubview(createProductLabel)
        view.addSubview(createProductView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            createProductLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            createProductLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            
            createProductView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            createProductView.topAnchor.constraint(equalTo: createProductLabel.bottomAnchor, constant: 10),
            createProductView.widthAnchor.constraint(equalTo: view.widthAnchor),
            createProductView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
    }
}
