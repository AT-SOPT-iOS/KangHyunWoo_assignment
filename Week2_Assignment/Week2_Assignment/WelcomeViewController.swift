//
//  WelcomeViewController.swift
//  Week2_Assignment
//
//  Created by hyunwoo on 4/13/25.
//

import UIKit

protocol DataBindDelegate: AnyObject {
    func dataBind(id : String)
}

class WelcomeViewController: UIViewController {
    weak var delegate: DataBindDelegate?
    
    var id : String?
    private func bindId(){
        if let id = id{
            self.welcomeLabel.text = "\(id)님 \n반가워요!"
        } else{
            self.welcomeLabel.text = "회원님 \n환영합니다!"
        }
    }
    
    private lazy var imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Logo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var welcomeLabel : UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "gray84")
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont(name: "Pretendard-Bold", size: 23)
        return label
    }()
    
    private lazy var backToMainButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("메인으로", for: .normal)
        button.backgroundColor = UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1)
        button.layer.cornerRadius = 8
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Medium", size: 14)
        return button
    }()
    
    private func setupconstraints(){
        NSLayoutConstraint.activate([
            backToMainButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -70),
            backToMainButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            backToMainButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            backToMainButton.heightAnchor.constraint(equalToConstant: 52)
        ])
        
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 67),
            welcomeLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
            
        ])
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 56),
            imageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            imageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            imageView.heightAnchor.constraint(equalToConstant: 210)
        ])
        
    }
    
    @objc
    private func backToMainButtonDidTap(){
        
        if let id = id{
            delegate?.dataBind(id: id)
        }
        
        if self.navigationController == nil{
            self.dismiss(animated: true)
        } else{
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .black
        setLayout()
        setupconstraints()
        bindId()
    }
    private func setLayout(){
        [backToMainButton, welcomeLabel,imageView].forEach {
            self.view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}
