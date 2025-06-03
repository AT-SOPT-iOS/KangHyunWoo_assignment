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
    let rank: String
    let broadcast: String
    let name: String
    let rate: String
}

let liveDummy: [LiveModel] = [
    LiveModel(imageName: "Live1", rank: "1", broadcast: "tvN", name: "환승연애3", rate: "10.3%"),
    LiveModel(imageName: "Live2", rank: "2", broadcast: "JTBC", name: "별들에게물어봐", rate: "9.5%"),
    LiveModel(imageName: "Live3", rank: "3", broadcast: "tvN", name: "지구오락실", rate: "8.3%"),
    LiveModel(imageName: "Live4", rank: "4", broadcast: "tvN", name: "언슬전생", rate: "6.1%"),
    LiveModel(imageName: "Live5", rank: "5", broadcast: "tvN", name: "이혼보험", rate: "3.5%")
]
