//
//  SportsData.swift
//  TvingClone
//
//  Created by hyunwoo on 5/2/25.
//

import UIKit

struct SportsData {
    let sportsImg: UIImage
}

// 화면에 보여질 데이터 더미 (서버통신을 하고 있지 않기 때문에 더미데이터 사용)
extension SportsData {
    static func dummy() -> [SportsData] {
        return [
            SportsData(sportsImg: .appleTv),
            SportsData(sportsImg: .KBO),
            SportsData(sportsImg: .KBL),
            SportsData(sportsImg: .AFC)
        ]
    }
}
