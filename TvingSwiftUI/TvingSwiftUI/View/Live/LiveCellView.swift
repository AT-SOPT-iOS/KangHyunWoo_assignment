//
//  LiveCellView.swift
//  TvingSwiftUI
//
//  Created by hyunwoo on 6/2/25.
//
import SwiftUI

struct LiveCellView: View {
    let live: LiveModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(live.imageName)
                .resizable()
                .frame(width: 160, height: 80)
                .cornerRadius(3)

            HStack(alignment: .top, spacing: 4) {
                Text(live.rank)
                    .italic()
                    .font(.title3)
                    .foregroundColor(.black)
                    .bold()
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(live.broadcast)
                        .bold()
                        .foregroundColor(.black)
                    
                    Text(live.name)
                        .foregroundColor(.gray2)
                        .font(.caption)
                    
                    Text(live.rate)
                        .foregroundColor(.gray2)
                        .font(.caption)
                }
            }
        }
        .frame(width: 160)
    }
}

