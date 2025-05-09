//
//  LifeCollectionViewCell.swift
//  TvingClone
//
//  Created by hyunwoo on 5/2/25.
//

import UIKit
import SnapKit

class LifeCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "LifeCollectionViewCell"
    
    private let itemImageView = UIImageView()
    
    private let lifeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Pretendard-Bold", size: 15)
        return label
    }()
    
    private let lifeImage : UIImageView = {
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
        [itemImageView, lifeLabel, lifeImage].forEach {
            contentView.addSubview($0)
        }
        lifeLabel.snp.makeConstraints {
            $0.trailing.equalTo(lifeImage.snp.leading).offset(-5)
        }
        lifeImage.snp.makeConstraints {
            $0.top.bottom.trailing.equalToSuperview()
            $0.leading.equalToSuperview().inset(15)
        }
    }
}
extension LifeCollectionViewCell {
    func dataBind(_ lifeData: LifeData){
        lifeImage.image = lifeData.lifeImg
    }
}

