//
//  BaseBallView.swift
//  TvingSwiftUI
//
//  Created by hyunwoo on 5/29/25.
//
import SwiftUI

struct BaseBallView: View {
    let balls: [BaseBallModel]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 12){
                ForEach(balls) { ball in
                    BaseBallCellView(ball: ball)
                }
            }
            .padding(.horizontal,10)
        }
        .frame(height: 50)
    }
}

#Preview {
    BaseBallView(balls: BasBallDummy)
}
