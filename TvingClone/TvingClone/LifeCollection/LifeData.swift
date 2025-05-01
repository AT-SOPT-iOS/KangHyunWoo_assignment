//
//  LifeData.swift
//  TvingClone
//
//  Created by hyunwoo on 5/2/25.
//

import UIKit

struct LifeData {
    let lifeImg: UIImage
}

// 화면에 보여질 데이터 더미 (서버통신을 하고 있지 않기 때문에 더미데이터 사용)
extension LifeData {
    static func dummy() -> [LifeData] {
        return [
            LifeData(lifeImg: .live1),
            LifeData(lifeImg: .live2),
            LifeData(lifeImg: .live3),
            LifeData(lifeImg: .live4),
            LifeData(lifeImg: .live5)
        ]
    }
}
