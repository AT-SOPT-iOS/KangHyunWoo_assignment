//
//  MovieResponseModel.swift
//  TvingClone
//
//  Created by hyunwoo on 5/8/25.
//

import Foundation

struct MovieResponseWrapper: Codable {
    let boxOfficeResult: BoxOfficeResult
}

struct BoxOfficeResult: Codable {
    let dailyBoxOfficeList: [MovieResponseModel]
}

struct MovieResponseModel: Codable {
    let rank: String
    let movieNm: String
    let openDt: String
}
