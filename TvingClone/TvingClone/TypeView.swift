//
//  TypeView.swift
//  TvingClone
//
//  Created by hyunwoo on 5/2/25.
//
import UIKit
import SnapKit

class TypeView: UIView {
    
    private let homeLabel: UILabel = {
            let label = UILabel()
            label.text = "홈"
            label.font = UIFont(name: "Pretendard-Medium", size: 17)
            label.textColor = .white
            label.textAlignment = .center
            return label
        }()
        
        private let dramaLabel: UILabel = {
            let label = UILabel()
            label.text = "드라마"
            label.font = UIFont(name: "Pretendard-Medium", size: 17)
            label.textColor = .white
            label.textAlignment = .center
            return label
        }()
        
        private let comedyLabel: UILabel = {
            let label = UILabel()
            label.text = "코미디"
            label.font = UIFont(name: "Pretendard-Medium", size: 17)
            label.textColor = .white
            label.textAlignment = .center
            return label
        }()
        
        private let movieLabel: UILabel = {
            let label = UILabel()
            label.text = "영화"
            label.font = UIFont(name: "Pretendard-Medium", size: 17)
            label.textColor = .white
            label.textAlignment = .center
            return label
        }()
        
        private let sportLabel: UILabel = {
            let label = UILabel()
            label.text = "스포츠"
            label.font = UIFont(name: "Pretendard-Medium", size: 17)
            label.textColor = .white
            label.textAlignment = .center
            return label
        }()
        
        private let newsLabel: UILabel = {
            let label = UILabel()
            label.text = "뉴스"
            label.font = UIFont(name: "Pretendard-Medium", size: 17)
            label.textColor = .white
            label.textAlignment = .center
            return label
        }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .black
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout(){
        [homeLabel,dramaLabel, comedyLabel, movieLabel, sportLabel, newsLabel].forEach{
            self.addSubview($0)
        }
        homeLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(15)
            $0.leading.equalToSuperview().offset(15)
        }
        
        dramaLabel.snp.makeConstraints{
            $0.top.equalTo(homeLabel.snp.top)
            $0.leading.equalTo(homeLabel.snp.trailing).offset(30)
            
        }
        comedyLabel.snp.makeConstraints{
            $0.top.equalTo(homeLabel.snp.top)
            $0.leading.equalTo(dramaLabel.snp.trailing).offset(30)
            
        }
        movieLabel.snp.makeConstraints{
            $0.top.equalTo(homeLabel.snp.top)
            $0.leading.equalTo(comedyLabel.snp.trailing).offset(30)
            
        }
        sportLabel.snp.makeConstraints{
            $0.top.equalTo(homeLabel.snp.top)
            $0.leading.equalTo(movieLabel.snp.trailing).offset(30)
        }
        newsLabel.snp.makeConstraints{
            $0.top.equalTo(homeLabel.snp.top)
            $0.trailing.equalToSuperview().offset(-15)
        }
    }
    
}
