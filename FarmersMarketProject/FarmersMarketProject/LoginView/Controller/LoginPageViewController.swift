import UIKit

final class LoginPageViewController: UIViewController {
    
    private var contentView = LoginPageView()
    
    private let loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Log in"
        label.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
}

extension LoginPageViewController: LoginPageViewDelegate {
    
    func loginButtonPressed(user: UserToLogin) {
        let url = URL(string: "https://farmer-market-zlmy.onrender.com/api/login/")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let data = try! JSONEncoder().encode(user)
        request.httpBody = data
    
        request.setValue(
            "application/json",
            forHTTPHeaderField: "Content-Type"
        )

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            let statusCode = (response as! HTTPURLResponse).statusCode
    
            if statusCode == 400 {
                print("error: not valid request")
            } else {
                print(statusCode)
            }
        }
    
        task.resume()
    }
    
    func loginButtonPressed() {
        
        let newViewController = MainMenuTabBarController()
        newViewController.modalPresentationStyle = .fullScreen
        self.present(newViewController, animated: true, completion: nil)
    }
    
    func signUpButtonPressed() {
        let newViewController = CreateAccountViewController()
        newViewController.modalPresentationStyle = .fullScreen
        self.present(newViewController, animated: true, completion: nil)
    }
}

private extension LoginPageViewController {
    
    private func setupView() {
        view.backgroundColor = .white
        contentView.delegate = self
        addSubviews()
        setupConstraints()
    }
    
    private func addSubviews() {
        view.addSubview(loginLabel)
        view.addSubview(contentView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            loginLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            loginLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            
            contentView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            contentView.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 10),
            contentView.widthAnchor.constraint(equalTo: view.widthAnchor),
            contentView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
    }
}
