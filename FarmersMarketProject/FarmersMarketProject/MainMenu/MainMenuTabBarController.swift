import UIKit

final class MainMenuTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTabs()
        setupView()
    }
}

extension MainMenuTabBarController {
    private func configureTabs() {
        let productCategoriesVC = ProductCategoriesViewController()
        let trackOrderVC = CheckoutViewController()
        let profileVC = ProfileViewController()
        let basketVC = BasketViewController()
        
        let productListingVC = ProductListingViewController()
        
        productCategoriesVC.tabBarItem.image = UIImage(systemName: "house.fill")
        productCategoriesVC.tabBarItem.image?.withTintColor(.black)
        productCategoriesVC.tabBarItem.title = "Products"
        
        trackOrderVC.tabBarItem.image = UIImage(systemName: "arrow.left.arrow.right")
        trackOrderVC.tabBarItem.image?.withTintColor(.black)
        trackOrderVC.tabBarItem.title = "Track Order"
        
        profileVC.tabBarItem.image = UIImage(systemName: "person.fill")
        profileVC.tabBarItem.image?.withTintColor(.black)
        profileVC.tabBarItem.badgeColor = .black
        profileVC.tabBarItem.title = "Profile"
        
        basketVC.tabBarItem.image = UIImage(systemName: "basket.fill")
        basketVC.tabBarItem.image?.withTintColor(.black)
        basketVC.tabBarItem.badgeColor = .black
        basketVC.tabBarItem.title = "Basket"
        
        productListingVC.tabBarItem.image = UIImage(systemName: "basket.fill")
        productListingVC.tabBarItem.image?.withTintColor(.black)
        productListingVC.tabBarItem.badgeColor = .black
        productListingVC.tabBarItem.title = "My products"

        let nav1 = UINavigationController(rootViewController: productCategoriesVC)
        let nav2 = UINavigationController(rootViewController: trackOrderVC)
        let nav3 = UINavigationController(rootViewController: profileVC)
        let nav4 = UINavigationController(rootViewController: basketVC)
        let nav5 = UINavigationController(rootViewController: productListingVC)
        
        tabBar.tintColor = UIColor(named: "Color")!
        tabBar.backgroundColor = .systemGray6
        
        let defaults = UserDefaults.standard
        
        if defaults.string(forKey: "Role") == "farmer" {
            setViewControllers([nav1, nav5, nav3], animated: true)
        } else {
            setViewControllers([nav1, nav2, nav4, nav3], animated: true)
        }
        
    }
}

private extension MainMenuTabBarController {
    private func setupView() {
        view.backgroundColor = .white
    }
    
    private func addSubviews() {
        
    }
    
    private func setupConstraints() {
        
    }
    
}
