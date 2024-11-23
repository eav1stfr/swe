import UIKit

final class BasketViewController: UIViewController {
    
    private let paymentView = PaymentSummaryView()
    
    private let basketView = BasketView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private let basketLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Basket"
        label.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
        label.textColor = .black
        return label
    }()
    
}

private extension BasketViewController {
    
    private func setupView() {
        basketView.delegate = self
        paymentView.translatesAutoresizingMaskIntoConstraints = false
        addSubviews()
        setupConstraints()
    }
    
    private func addSubviews() {
        view.addSubview(basketLabel)
        view.addSubview(basketView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            basketLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 63),
            basketLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            basketView.topAnchor.constraint(equalTo: basketLabel.bottomAnchor, constant: 20),
            basketView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            basketView.widthAnchor.constraint(equalTo: view.widthAnchor),
            basketView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
    }
}

extension BasketViewController: BasketViewDelegate {
    func makeOrder(listOfProducts: [BasketProductModel]) {
        print("order now button pressed")
    }
}
