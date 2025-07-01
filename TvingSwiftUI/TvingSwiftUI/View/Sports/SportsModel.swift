//
//  SportsModel.swift
//  TvingSwiftUI
//
//  Created by hyunwoo on 5/29/25.
//
import SwiftUI

struct SportsModel: Identifiable {
    let id = UUID()
    let imageName: String
}

let sportsDummy: [SportsModel] = [
    SportsModel(imageName: "KBO"),
    SportsModel(imageName: "KBL"),
    SportsModel(imageName: "AppleTv"),
    SportsModel(imageName: "AFC")
]
