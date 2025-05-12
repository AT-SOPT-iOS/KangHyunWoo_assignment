//
//  MovieViewController.swift
//  TvingClone
//
//  Created by hyunwoo on 5/9/25.
//

import UIKit
import SnapKit
import Then

final class MovieViewController: UIViewController {
    
    private var targetDt : String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        setLayout()
    }
    
    @objc private func searchButtonTap() {
        Task {
            do{
                let mymovie = try await MovieInfoService.shared.fetchMovieList(targetDt : self.targetDt)
                let infotext = mymovie.map{"\($0.rank)위- 영화이름 : \($0.movieNm)- 오픈날짜 : \($0.openDt)"}.joined(separator: "\n")
                //nicknameList.map {"\($0)" }.joined(separator: "\n")
                self.infoLabel.text = "영화 :\n\(infotext)"
                
            } catch {
                self.infoLabel.text = "조회실패 : \(error.localizedDescription)"
            }
        }
    }
    
    @objc private func textFieldDidEditing(_ textField: UITextField) {
        self.targetDt = textField.text ?? ""
    }
    
    
    private func setLayout() {
        self.view.addSubview(stackView)
        
        stackView.snp.makeConstraints {
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(40)
            $0.top.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(100)
        }
        
        [movieTextField,infoLabel,searchButton].forEach {
            self.stackView.addArrangedSubview($0)
        }
    }
    private let stackView = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .equalSpacing
        $0.spacing = 20
    }
    private lazy var movieTextField = UITextField().then{
        $0.backgroundColor = .lightGray
        $0.placeholder = "날짜를 입력하세요"
        $0.layer.cornerRadius = 4
        $0.heightAnchor.constraint(equalToConstant: 44).isActive = true
        $0.setLeftPadding(12)
        $0.addTarget(self, action: #selector(textFieldDidEditing(_:)), for: .editingChanged)
    }
    
    
    private lazy var searchButton = UIButton().then {
        $0.addTarget(self,
                     action: #selector(searchButtonTap),
                     for: .touchUpInside)
        $0.backgroundColor = .red
        $0.setTitle("박스오피스 검색", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 8
        $0.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
    
    private lazy var infoLabel = UILabel().then {
        $0.textColor = .white
        $0.textAlignment = .left
        $0.numberOfLines = 0
        $0.font = .systemFont(ofSize: 16)
    }
}


private extension UITextField {
    func setLeftPadding(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}

