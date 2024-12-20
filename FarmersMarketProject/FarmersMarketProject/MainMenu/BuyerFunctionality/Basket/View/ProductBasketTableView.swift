import UIKit

final class ProductBasketTableView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let tableView = UITableView()
    
    private let products: [BasketProductModel] = []
}

//POST http://127.0.0.1:8000/api/orders/place/
//кидаешь такое
//{
//    "items": [
//        {
//            "farmer_product": 1,
//            "quantity": 0
//        },
//        {
//            "farmer_product": 4,
//            "quantity": 1
//        }
//    ]
//}
//
//возвращает тебе:
//{"id":5,
//"status":"pending",
//"items":
//     [
//{"farmer_product":1,"product_name":"Banana","farmer":"rimma","quantity":0,"price":100000.0,"total_price":0.0},{"farmer_product":4,"product_name":"Banana","farmer":"farmer","quantity":1,"price":20.99,"total_price":20.99}
//]
//}

extension ProductBasketTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension ProductBasketTableView: UITableViewDelegate {
    
}

private extension ProductBasketTableView {
    
    private func setupView() {
        
    }
    
    private func addSubviews() {
        addSubview(tableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
}

