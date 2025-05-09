//
//  TopCollectionViewCell.swift
//  TvingClone
//
//  Created by hyunwoo on 5/1/25.
//

import UIKit
import SnapKit

class TopCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TopCollectionViewCell"
    
    private let movieImageView = UIImageView()
    
    private let ranklabel : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Pretendard-Bold", size: 50)
        label.transform = CGAffineTransform(rotationAngle: 0.05)
        label.textAlignment = .center
        return label
    }()
    
    private let posterImage : UIImageView = {
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
    
    private func setLayout(){
        [ranklabel, posterImage].forEach {
            contentView.addSubview($0)
        }
        ranklabel.snp.makeConstraints {
            $0.trailing.equalTo(posterImage.snp.leading).offset(-5)
            $0.bottom.equalToSuperview()
            
        }
        posterImage.snp.makeConstraints {
            $0.top.bottom.trailing.equalToSuperview()
            $0.leading.equalToSuperview().inset(50)
        }
    }
    
}

extension TopCollectionViewCell {
    func dataBind(_ itemData: TopModel) {
        posterImage.image = itemData.movieImg
        ranklabel.text = itemData.rank
     }
}
