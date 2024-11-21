import UIKit

final class ProductListingTableCustomCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let productName: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private let quantityLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
}

extension ProductListingTableCustomCell {
    func set(cellModel: TableProductListingCellModel) {
        productName.text = String(cellModel.product)
        priceLabel.text = cellModel.price
        quantityLabel.text = String(cellModel.available_quantity)
    }
}

private extension ProductListingTableCustomCell {
    private func setupView() {
        addSubviews()
        setupConstraints()
    }
    
    private func addSubviews() {
        addSubview(productName)
        addSubview(priceLabel)
        addSubview(quantityLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            productName.centerXAnchor.constraint(equalTo: centerXAnchor),
            productName.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            
            priceLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            priceLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            quantityLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            quantityLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
}
