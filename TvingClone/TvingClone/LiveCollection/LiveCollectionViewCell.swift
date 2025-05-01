//
//  LiveCollectionViewCell.swift
//  TvingClone
//
//  Created by hyunwoo on 5/2/25.
//

import UIKit
import SnapKit

class LiveCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "LiveCollectionViewCell"
    
    private let itemImageView = UIImageView()
    
    private let nameLabel : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Pretendard-Bold", size: 15)
        return label
    }()
    
    private let liveImage : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 3
        return imageView
    }()
    
    
    
    private let rankLabel : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Pretendard-Bold", size: 19)
        label.textAlignment = .center
        return label
    }()
    
    private let broadLabel : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Pretendard-Bold", size: 10)
        label.textAlignment = .left
        return label
    }()
    
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Medium", size: 10)
        return label
    }()
    
    private let seeLabel : UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.textAlignment = .left
        label.font = UIFont(name: "Pretendard-Medium", size: 10)
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
    
    private func setLayout() {
        [itemImageView, liveImage, nameLabel, rankLabel, broadLabel, titleLabel, seeLabel].forEach {
            contentView.addSubview($0)
        }
        nameLabel.snp.makeConstraints {
            $0.trailing.equalTo(liveImage.snp.leading).offset(-5)
        }
        liveImage.snp.makeConstraints {
            $0.top.trailing.equalToSuperview()
            $0.leading.equalToSuperview().inset(15)
            $0.height.equalTo(80)
        }
        rankLabel.snp.makeConstraints {
            $0.top.equalTo(liveImage.snp.bottom).offset(5)
            $0.leading.equalToSuperview().offset(15)
        }
        broadLabel.snp.makeConstraints {
            $0.top.equalTo(liveImage.snp.bottom).offset(5)
            $0.leading.equalToSuperview().offset(35)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(broadLabel.snp.bottom).offset(2)
            $0.leading.equalToSuperview().offset(35)
        }
        seeLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(2)
            $0.leading.equalToSuperview().offset(35)
        }
    }
}
extension LiveCollectionViewCell {
    func dataBind(_ liveData: LiveData) {
        liveImage.image = liveData.liveImg
        rankLabel.text = liveData.rank
        broadLabel.text = liveData.broadcast
        titleLabel.text = liveData.title
        seeLabel.text = liveData.see
     }
}
