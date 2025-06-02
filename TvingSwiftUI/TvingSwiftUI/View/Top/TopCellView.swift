//
//  TopCellView.swift
//  TvingSwiftUI
//
//  Created by hyunwoo on 6/3/25.
//
import SwiftUI

struct TopCellView: View {
    let top: TopModel

    var body: some View {
        HStack(spacing: 6) {
            VStack {
                Spacer()
                Text(top.rank)
                    .font(.system(size: 40, weight: .bold))
                    .italic()
                    .foregroundColor(.white)
                    .shadow(color: .gray.opacity(0.5), radius: 2, x: 0, y: 4)
            }
            
            Image(top.imageName)
                .resizable()
                .frame(width: 98, height: 146)
                .shadow(radius: 3)
        }
    }
}
