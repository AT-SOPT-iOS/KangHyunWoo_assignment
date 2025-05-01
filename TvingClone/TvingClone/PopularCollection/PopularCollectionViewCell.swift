//
//  PopularCollectionViewCell.swift
//  TvingClone
//
//  Created by hyunwoo on 5/2/25.
//

import UIKit
import SnapKit

class PopularCollectionViewCell: UICollectionViewCell {
    static let identifier = "PopularCollectionViewCell"
    
    private let itemImageView = UIImageView()
    
    private let popularLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Pretendard-Bold", size: 15)
        return label
    }()
    
    private let plusLabel : UILabel = {
        let label = UILabel()
        label.textColor = .gray2
        label.font = UIFont(name: "Pretendard-Medium", size: 12)
        return label
    }()
    
    private let movieImage : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 3
        return imageView
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
    
    private func setLayout() {
        [itemImageView, popularLabel, plusLabel, movieImage].forEach {
            contentView.addSubview($0)
        }
        popularLabel.snp.makeConstraints {
            $0.trailing.equalTo(movieImage.snp.leading).offset(-5)
        }
        movieImage.snp.makeConstraints {
            $0.top.bottom.trailing.equalToSuperview()
            $0.leading.equalToSuperview().inset(15)
        }
        plusLabel.snp.makeConstraints {
            $0.trailing.equalTo(movieImage.snp.trailing).inset(5)
            $0.bottom.equalToSuperview()
        }
    }
}
extension PopularCollectionViewCell {
    func dataBind(_ popularData: PopularData){
        movieImage.image = popularData.movieImg
    }
}
