//
//  PopularData.swift
//  TvingClone
//
//  Created by hyunwoo on 5/2/25.
//

import UIKit

struct PopularData {
    let movieImg: UIImage
}

// 화면에 보여질 데이터 더미 (서버통신을 하고 있지 않기 때문에 더미데이터 사용)
extension PopularData {
    static func dummy() -> [PopularData] {
        return [
            PopularData(movieImg: .top1),
            PopularData(movieImg: .top2),
            PopularData(movieImg: .top3),
            PopularData(movieImg: .top4)
        ]
    }
}
