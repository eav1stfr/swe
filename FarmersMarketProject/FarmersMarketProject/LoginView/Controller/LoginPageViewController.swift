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
    func parseJson(userData: Data) -> UserLoginReturn? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(UserLoginReturn.self, from: userData)
            let token = decodedData.token
            let role = decodedData.role
            
            let user = UserLoginReturn(token: token, role: role)
            return user
        } catch {
            return nil
        }
    }
    
    func loginButtonWasPressed(user: UserToLogin) {
        print("button pressed")
        print(user.username_or_email)
        print(user.password)
        
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
            print(statusCode)
            
            if let safeData = data {
                if let user = self.parseJson(userData: safeData) {
                    let defaults = UserDefaults.standard
                    defaults.set(user.token, forKey: "UserToken")
                    defaults.set(user.role, forKey: "Role")
                    print(user.token)
                }
            }
            
            if statusCode == 400 {
                print("what?")
                DispatchQueue.main.async {
                    let alertController = UIAlertController(title: "Error", message: "No such user exists, or the password is incorrect", preferredStyle: .alert)
                    let action = UIAlertAction(title: "Try again", style: .default)
                    alertController.addAction(action)
                    self.present(alertController, animated: true)
                }
            } else {
                let defaults = UserDefaults.standard
                defaults.set(true, forKey: "IsAuthorized")
                defaults.set(user.username_or_email, forKey: "Email")
                print("success")
                DispatchQueue.main.async {
                    let newViewController = MainMenuTabBarController()
                    newViewController.modalPresentationStyle = .fullScreen
                    self.present(newViewController, animated: true, completion: nil)
                }
            }
        }
        task.resume()
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
