//
//  LiveModel.swift
//  TvingSwiftUI
//
//  Created by hyunwoo on 6/2/25.
//
import SwiftUI

struct LiveModel: Identifiable {
    let id = UUID()
    let imageName: String
}

let liveDummy: [LiveModel] = [
    LiveModel(imageName: "Live1"),
    LiveModel(imageName: "Live2"),
    LiveModel(imageName: "Live3"),
    LiveModel(imageName: "Live4"),
    LiveModel(imageName: "Live5")
]
