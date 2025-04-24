//
//  LoginViewController.swift
//  Week2_Assignment
//
//  Created by hyunwoo on 4/13/25.
//

import UIKit

class LoginViewController: UIViewController , DataBindDelegate{
    func dataBind(id: String) {
        passwordTextField.text = id
    }
    
    
    
    // UI 요소 선언
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "TVING ID 로그인"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private lazy var idTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "아이디"
        textField.backgroundColor = UIColor(named: "gray4")
        textField.layer.cornerRadius = 3
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0)) // left padding
        textField.leftViewMode = .always
        textField.textColor = .white
        return textField
    }()
    
    private lazy var idDeleteButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "ResetButton"), for: .normal)
        button.addTarget(self, action: #selector(clearTextField), for: .touchUpInside)
        return button
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "비밀번호"
        textField.backgroundColor = UIColor(named: "gray4")
        textField.layer.cornerRadius = 3
        textField.isSecureTextEntry = true // 비밀번호 숨김
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0)) // left padding
        textField.leftViewMode = .always
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("로그인하기", for: .normal)
        button.backgroundColor = UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1)
        button.layer.cornerRadius = 3
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(loginButtonDidTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var findIdLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "아이디찾기"
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private lazy var findPasswordLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "비밀번호찾기"
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private lazy var createAccountLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "아직 계정이 없으신가요?"
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private lazy var createNickNameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "닉네임 만들러가기"
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private func presentToWelcomeVC(){
        let welcomeViewController = WelcomeViewController()
        welcomeViewController.modalPresentationStyle = .formSheet
        welcomeViewController.id = passwordTextField.text
        self.present(welcomeViewController, animated: true)
    }
    
    private func pushToWelcomeVC(){
        let welcomeViewController = WelcomeViewController()
        welcomeViewController.delegate = self
        welcomeViewController.id = idTextField.text
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
    
    @objc
    private func loginButtonDidTapped() {
        print("로그인버튼 눌림")
        pushToWelcomeVC()
        }
    @objc
    private func clearTextField() {
        idTextField.text = ""
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // 배경색 설정
        view.backgroundColor = .black
        // UI 요소들 추가
        setupViews()
        // Auto Layout 설정
        setupConstraints()
    }
    
    private func setupViews() {
        view.addSubview(titleLabel)
        view.addSubview(idTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        view.addSubview(findIdLabel)
        view.addSubview(findPasswordLabel)
        view.addSubview(createAccountLabel)
        view.addSubview(createNickNameLabel)
        view.addSubview(idDeleteButton)
    }
    
    private func setupConstraints() {
        // Title Label Constraints
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 120),
            titleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 110)
        ])
        
        // ID TextField Constraints
        NSLayoutConstraint.activate([
            idTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            idTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            idTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            idTextField.heightAnchor.constraint(equalToConstant: 52)
        ])
        
        NSLayoutConstraint.activate([
            idDeleteButton.topAnchor.constraint(equalTo: idTextField.topAnchor, constant: 18),
            idDeleteButton.trailingAnchor.constraint(equalTo: idTextField.trailingAnchor, constant: -20),
            idDeleteButton.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        // Password TextField Constraints
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: idTextField.bottomAnchor, constant: 11),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            passwordTextField.heightAnchor.constraint(equalToConstant: 52)
        ])
        
        // Login Button Constraints
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            loginButton.heightAnchor.constraint(equalToConstant: 52)
        ])
        
        NSLayoutConstraint.activate([
            findIdLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 30),
            findIdLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 51),
            findIdLabel.widthAnchor.constraint(equalToConstant: 100), // 너비를 고정
            findIdLabel.heightAnchor.constraint(equalToConstant: 22)
        ])
        
        NSLayoutConstraint.activate([
            findPasswordLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 30),
            findPasswordLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -85),
            findPasswordLabel.widthAnchor.constraint(equalToConstant: 100),
            findPasswordLabel.heightAnchor.constraint(equalToConstant: 22),
        ])
        
        NSLayoutConstraint.activate([
            createAccountLabel.topAnchor.constraint(equalTo: findIdLabel.bottomAnchor, constant: 30),
            createAccountLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 51),
            // 너비를 고정하지 않고, UILabel이 intrinsicContentSize에 맞게 크기를 결정하도록 설정
            createAccountLabel.widthAnchor.constraint(equalToConstant: 135),
            createAccountLabel.heightAnchor.constraint(equalToConstant: 22),
        ])
        
        
        NSLayoutConstraint.activate([
            createNickNameLabel.topAnchor.constraint(equalTo: findPasswordLabel.bottomAnchor, constant: 30),
            createNickNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -65),
            createNickNameLabel.widthAnchor.constraint(equalToConstant: 128),
            createNickNameLabel.heightAnchor.constraint(equalToConstant: 22),
        ])
    }
    
}
