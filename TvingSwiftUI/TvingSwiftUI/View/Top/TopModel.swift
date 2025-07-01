//
//  TopModel.swift
//  TvingSwiftUI
//
//  Created by hyunwoo on 6/3/25.
//
import SwiftUI

struct TopModel: Identifiable {
    let id = UUID()
    let imageName: String
    let rank: String
}

let topDummy: [TopModel] = [
    TopModel(imageName: "top1", rank: "1"),
    TopModel(imageName: "top2", rank: "2"),
    TopModel(imageName: "top3", rank: "3"),
    TopModel(imageName: "top4", rank: "4")
]

