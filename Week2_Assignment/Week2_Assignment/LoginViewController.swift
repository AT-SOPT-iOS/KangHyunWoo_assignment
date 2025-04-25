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
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "TVING ID 로그인"
        label.font = UIFont(name : "Pretendard-SemiBold", size: 24)
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
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.leftViewMode = .always
        textField.textColor = UIColor(named: "gray2")
        textField.addTarget(self, action: #selector(textFieldDidBegin), for: .editingDidBegin)
        textField.addTarget(self, action: #selector(textFieldDidEnd), for: .editingDidEnd)
        return textField
    }()
    
    private lazy var idDeleteButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named : "ResetButton")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(image, for: .normal)
        button.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(clearIdTextField), for: .touchUpInside)
        return button
    }()
    
    private lazy var passwordDeleteButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named : "ResetButton")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(image, for: .normal)
        button.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(clearPasswordTextField), for: .touchUpInside)
        button.isHidden = true
        return button
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "비밀번호"
        textField.backgroundColor = UIColor(named: "gray4")
        textField.layer.cornerRadius = 3
        textField.isSecureTextEntry = true
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.leftViewMode = .always
        textField.addTarget(self, action: #selector(textFieldDidBegin), for: .editingDidBegin)
        textField.addTarget(self, action: #selector(textFieldDidEnd), for: .editingDidEnd)
        textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        textField.addTarget(self, action: #selector(buttonVisible), for: .editingChanged)
        return textField
    }()
    
    private lazy var eyeButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "DarkEyes")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(image, for: .normal)
        button.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
        button.isHidden = true
        return button
    }()
    
    private lazy var notShowButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named : "NotShow")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(image, for: .normal)
        button.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
        button.isHidden = true
        return button
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("로그인하기", for: .normal)
        button.backgroundColor = UIColor(named: "gray5")
        button.layer.cornerRadius = 3
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Medium", size: 18)
        button.addTarget(self, action: #selector(loginButtonDidTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var findIdLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "아이디찾기"
        label.textColor = .gray
        label.font = UIFont(name : "Pretendard-Light", size: 14)
        return label
    }()
    
    private lazy var divideLine : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "gray4")
        return view
    }()
    
    private lazy var findPasswordLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "비밀번호찾기"
        label.textColor = .gray
        label.font = UIFont(name : "Pretendard-Light", size: 14)
        return label
    }()
    
    private lazy var createAccountLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "아직 계정이 없으신가요?"
        label.textColor = .gray
        label.font = UIFont(name : "Pretendard-Light", size: 14)
        return label
    }()
    
    private lazy var createNickNameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "닉네임 만들러가기"
        label.textColor = .gray
        label.font = UIFont(name : "Pretendard-Light", size: 14)
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
    private func clearIdTextField() {
        idTextField.text = ""
    }
    @objc
    private func clearPasswordTextField (){
        passwordTextField.text = ""
    }
    
    @objc
    private func buttonVisible(_ textField: UITextField) {
        if let idOn = idTextField.text, !idOn.isEmpty {
            idDeleteButton.isHidden = false
        }
        if let passwordOn = passwordTextField.text, !passwordOn.isEmpty {
            passwordDeleteButton.isHidden = false
            eyeButton.isHidden = false
        }
    }
    
    @objc
    private func togglePasswordVisibility() {
        passwordTextField.isSecureTextEntry.toggle()
        let isHidden = passwordTextField.isSecureTextEntry
        eyeButton.isHidden = !isHidden
        notShowButton.isHidden = isHidden
    }
    
    
    @objc
    func textFieldDidBegin(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.gray2.cgColor
        textField.layer.borderWidth = 1
    }
        
    @objc
    func textFieldDidEnd(_ textField: UITextField) {
        textField.layer.borderWidth = 0
    }
        
    @objc
    func textFieldDidChange(_ textField: UITextField) {
        if let idOn = idTextField.text, !idOn.isEmpty,
            let passwordOn = passwordTextField.text, !passwordOn.isEmpty{
                
            loginButton.backgroundColor = UIColor(named: "red")
            loginButton.setTitleColor(UIColor(named: "white"), for: .normal)
    }
        else {
            loginButton.backgroundColor = UIColor(named: "gray4")
            loginButton.setTitleColor(UIColor(named: "gray2"), for: .normal)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        view.addSubview(titleLabel)
        view.addSubview(idTextField)
        view.addSubview(passwordTextField)
        view.addSubview(eyeButton)
        view.addSubview(notShowButton)
        view.addSubview(loginButton)
        view.addSubview(findIdLabel)
        view.addSubview(findPasswordLabel)
        view.addSubview(createAccountLabel)
        view.addSubview(createNickNameLabel)
        view.addSubview(idDeleteButton)
        view.addSubview(passwordDeleteButton)
        view.addSubview(divideLine)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 120),
            titleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 110)
        ])
        
        NSLayoutConstraint.activate([
            idTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            idTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            idTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            idTextField.heightAnchor.constraint(equalToConstant: 52)
        ])
        
        NSLayoutConstraint.activate([
            idDeleteButton.centerYAnchor.constraint(equalTo: idTextField.centerYAnchor),
            idDeleteButton.trailingAnchor.constraint(equalTo: idTextField.trailingAnchor, constant: -20),
            idDeleteButton.widthAnchor.constraint(equalToConstant: 20),
            idDeleteButton.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: idTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            passwordTextField.heightAnchor.constraint(equalToConstant: 52)
        ])
        
        NSLayoutConstraint.activate([
            passwordDeleteButton.centerYAnchor.constraint(equalTo: passwordTextField.centerYAnchor),
            passwordDeleteButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor, constant: -60),
            passwordDeleteButton.widthAnchor.constraint(equalToConstant: 20),
            passwordDeleteButton.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            eyeButton.centerYAnchor.constraint(equalTo: passwordTextField.centerYAnchor),
            eyeButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor, constant: -20),
            eyeButton.widthAnchor.constraint(equalToConstant: 20),
            eyeButton.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            notShowButton.centerYAnchor.constraint(equalTo: passwordTextField.centerYAnchor),
            notShowButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor, constant: -20),
            notShowButton.widthAnchor.constraint(equalToConstant: 20),
            notShowButton.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            loginButton.heightAnchor.constraint(equalToConstant: 52)
        ])
        
        NSLayoutConstraint.activate([
            findIdLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 30),
            findIdLabel.leadingAnchor.constraint(equalTo: loginButton.leadingAnchor, constant: 65),
            findIdLabel.widthAnchor.constraint(equalToConstant: 100), // 너비를 고정
            findIdLabel.heightAnchor.constraint(equalToConstant: 22)
        ])
        
        NSLayoutConstraint.activate([
            findPasswordLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 30),
            findPasswordLabel.trailingAnchor.constraint(equalTo: loginButton.trailingAnchor, constant: -40),
            findPasswordLabel.widthAnchor.constraint(equalToConstant: 100),
            findPasswordLabel.heightAnchor.constraint(equalToConstant: 22),
        ])
        
        NSLayoutConstraint.activate([
            createAccountLabel.topAnchor.constraint(equalTo: findIdLabel.bottomAnchor, constant: 30),
            createAccountLabel.leadingAnchor.constraint(equalTo: loginButton.leadingAnchor, constant: 25),
            createAccountLabel.widthAnchor.constraint(equalToConstant: 135),
            createAccountLabel.heightAnchor.constraint(equalToConstant: 22),
        ])
        
        
        NSLayoutConstraint.activate([
            createNickNameLabel.topAnchor.constraint(equalTo: findPasswordLabel.bottomAnchor, constant: 30),
            createNickNameLabel.trailingAnchor.constraint(equalTo: loginButton.trailingAnchor, constant: -15),
            createNickNameLabel.widthAnchor.constraint(equalToConstant: 128),
            createNickNameLabel.heightAnchor.constraint(equalToConstant: 22),
        ])
        
        NSLayoutConstraint.activate([
            divideLine.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 30),
            divideLine.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            divideLine.widthAnchor.constraint(equalToConstant: 1),
            divideLine.heightAnchor.constraint(equalToConstant: 12),
        ])
    }
    
}
