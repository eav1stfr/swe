import UIKit

struct FarmerSellingProductJSON: Codable {
    var id: Int
    var name: String
    var description: String
    var price: String
    var category: String
    var created_at: String
    var updated_at: String
    var farmer_products: [FarmerSellingProduct]
}

struct FarmerSellingProduct: Codable {
    var id: Int
    var farmer_name: String
    var product: Int
    var available_quantity: Int
    var price: String
}

struct ProductToAdd: Codable {
    var farmer_product_id: Int
    var quantity: Int
}
