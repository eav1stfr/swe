import UIKit

final class BasketTableViewCustomCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var productNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 25)
        return label
    }()
    
    private var productQuantity: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 25)
        return label
    }()
    
    private var prodPrice: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 25)
        return label
    }()
    
    private var farmerName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 25)
        return label
    }()
}

extension BasketTableViewCustomCell {
    private func setupView() {
        addSubviews()
        setupConstraints()
    }
    
    private func addSubviews() {
        addSubview(productNameLabel)
        addSubview(productQuantity)
        addSubview(prodPrice)
        addSubview(farmerName)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 150),
            farmerName.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            farmerName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            productNameLabel.topAnchor.constraint(equalTo: farmerName.bottomAnchor, constant: 10),
            productNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            prodPrice.topAnchor.constraint(equalTo: farmerName.bottomAnchor, constant: 10),
            prodPrice.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 10),
            
            productQuantity.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor, constant: 10),
            productQuantity.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
        ])
    }
    
    func set(cell: BasketProductModel) {
        productNameLabel.text = cell.productName
        productQuantity.text = cell.productQuantity
        prodPrice.text = cell.productPrice
        farmerName.text = cell.farmerName
    }
    
}
