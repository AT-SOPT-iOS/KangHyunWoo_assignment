//
//  FavoriteModel.swift
//  TvingSwiftUI
//
//  Created by hyunwoo on 6/2/25.
//
import SwiftUI

struct FavoriteModel: Identifiable {
    let id = UUID()
    let imageName: String
}

let favoriteDummy: [FavoriteModel] = [
    FavoriteModel(imageName: "Live3"),
    FavoriteModel(imageName: "Live4"),
    FavoriteModel(imageName: "Live5"),
    FavoriteModel(imageName: "Live1"),
    FavoriteModel(imageName: "Live2"),
]
