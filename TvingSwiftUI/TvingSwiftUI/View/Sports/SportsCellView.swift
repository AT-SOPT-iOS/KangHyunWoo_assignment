//
//  SportsCellView.swift
//  TvingSwiftUI
//
//  Created by hyunwoo on 5/29/25.
//
import SwiftUI

struct SportsCellView: View {
    let sport: SportsModel
    
    var body: some View {
        Image(sport.imageName)
            .resizable()
            .frame(width: 90, height: 45)
            .cornerRadius(4)
    }
}
