//
//  LiveView.swift
//  TvingSwiftUI
//
//  Created by hyunwoo on 6/2/25.
//
import SwiftUI

struct LiveView: View {
    let lives: [LiveModel]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack{
                Text("실시간 인기 Live")
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(.white)
                    .padding(.leading, 16)
                
                Spacer()
                
                Text("더보기")
                    .font(.caption)
                    .foregroundColor(.gray2)
                    .padding(.trailing, 16)
            }
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 5){
                    ForEach(lives) { live in
                        LiveCellView(live: live)
                    }
                }
                .padding(.horizontal,16)
            }
        }
        .frame(height: 150)
    }
}

#Preview {
    LiveView(lives: liveDummy)
}
