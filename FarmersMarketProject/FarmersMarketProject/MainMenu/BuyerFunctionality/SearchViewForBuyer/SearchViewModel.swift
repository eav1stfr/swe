class SearchViewModel {
    var items: [Product] = []
    var filteredItems: [Product] = []
    var productData: ProductData

    init(productData: ProductData) {
        self.productData = productData
        self.items = productData.getProducts()
        self.filteredItems = productData.getProducts()
    }

    func filterResults(searchText: String) {
        if searchText.isEmpty {
            filteredItems = items
        } else {
            filteredItems = items.filter { item in
                item.name.lowercased().contains(searchText.lowercased())
            }
        }
    }

    func filterByPrice(minPrice: Int, maxPrice: Int) {
        // Filter on the already filtered search results
        filteredItems = filteredItems.filter { item in
            item.price >= minPrice && item.price <= maxPrice
        }
    }
}

