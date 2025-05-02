//
//  SportsCollectionViewCell.swift
//  TvingClone
//
//  Created by hyunwoo on 5/2/25.
//

import UIKit
import SnapKit

class SportsCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "SpotrtsCollectionViewCell"
    
    private let itemImageView = UIImageView()
    
    private let sportsImage : UIImageView = {
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
        [itemImageView, sportsImage].forEach {
            contentView.addSubview($0)
        }
        sportsImage.snp.makeConstraints {
            $0.top.bottom.trailing.equalToSuperview()
            $0.leading.equalToSuperview().inset(15)
        }
    }
}
extension SportsCollectionViewCell {
    func dataBind(_ sportsData: SportsData){
        sportsImage.image = sportsData.sportsImg
    }
}
