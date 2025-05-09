//
//  HeaderView.swift
//  TvingClone
//
//  Created by hyunwoo on 5/2/25.
//

import UIKit
import SnapKit

class HeaderView: UIView {
    private let logoImage : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Logo2")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let searchImage : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Search")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let smallLogoImage : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Logo3")
        imageView.contentMode = .scaleAspectFill
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
        [logoImage,searchImage,smallLogoImage].forEach {
            self.addSubview($0)
        }
        logoImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(5)
            $0.leading.equalToSuperview().offset(5)
            $0.width.equalTo(191)
            $0.height.equalTo(78)
        }
        searchImage.snp.makeConstraints {
            $0.centerY.equalTo(logoImage)
            $0.trailing.equalTo(smallLogoImage.snp.leading).offset(-10)
            $0.width.equalTo(30)
            $0.height.equalTo(30)
        }
        smallLogoImage.snp.makeConstraints{
            $0.centerY.equalTo(logoImage)
            $0.trailing.equalToSuperview().offset(-10)
            $0.width.equalTo(30)
            $0.height.equalTo(30)
        }
    }
}
