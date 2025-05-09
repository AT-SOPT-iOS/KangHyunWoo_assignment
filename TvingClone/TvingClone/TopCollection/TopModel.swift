//
//  TopModel.swift
//  TvingClone
//
//  Created by hyunwoo on 5/1/25.
//
import UIKit

// 화면에 보여질 데이터 타입
struct TopModel {
    let movieImg: UIImage
    let rank: String
}

// 화면에 보여질 데이터 더미 (서버통신을 하고 있지 않기 때문에 더미데이터 사용)
extension TopModel {
    static func dummy() -> [TopModel] {
        return [
            TopModel(movieImg: .top1, rank: "1"),
            TopModel(movieImg: .top2, rank: "2"),
            TopModel(movieImg: .top3, rank: "3"),
            TopModel(movieImg: .top4, rank: "4")
        ]
    }
}
