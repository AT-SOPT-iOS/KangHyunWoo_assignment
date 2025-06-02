//
//  LiveMovieModel.swift
//  TvingSwiftUI
//
//  Created by hyunwoo on 6/2/25.
//
import SwiftUI

struct LiveMovieModel: Identifiable {
    let id = UUID()
    let imageName: String
}

let livemoiveDummy: [LiveMovieModel] = [
    LiveMovieModel(imageName: "top1"),
    LiveMovieModel(imageName: "top2"),
    LiveMovieModel(imageName: "top3"),
    LiveMovieModel(imageName: "top4")
]
