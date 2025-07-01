//
//  BaseBallCellView.swift
//  TvingSwiftUI
//
//  Created by hyunwoo on 5/29/25.
//
import SwiftUI

struct BaseBallCellView: View {
    let ball: BaseBallModel
    
    var body: some View {
        Image(ball.imageName)
            .resizable()
            .frame(width: 40, height: 40)
            .shadow(radius: 2)
    }
}
