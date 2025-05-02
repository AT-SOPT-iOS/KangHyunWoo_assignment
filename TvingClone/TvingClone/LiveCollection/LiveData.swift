//
//  LiveData.swift
//  TvingClone
//
//  Created by hyunwoo on 5/2/25.
//

import UIKit

struct LiveData {
    let liveImg: UIImage
    let rank : String
    let broadcast : String
    let title : String
    let see : String
}

// 화면에 보여질 데이터 더미 (서버통신을 하고 있지 않기 때문에 더미데이터 사용)
extension LiveData {
    static func dummy() -> [LiveData] {
        return [
            LiveData(liveImg: .live1, rank : "1", broadcast: "TVING", title: "환승연애3", see: "12.5%"),
            LiveData(liveImg: .live2, rank : "2", broadcast: "JTBC", title: "별들에게 물어봐", see: "10.5%"),
            LiveData(liveImg: .live3, rank : "3", broadcast: "TVN", title: "지구오락실3", see: "8.5%"),
            LiveData(liveImg: .live4, rank : "4", broadcast: "TVN", title: "언슬전생", see: "7.5%"),
            LiveData(liveImg: .live5, rank : "5", broadcast: "TVN", title: "이혼보험", see: "6.5%")
        ]
    }
}
