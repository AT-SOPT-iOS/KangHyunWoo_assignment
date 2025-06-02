//
//  TopView.swift
//  TvingSwiftUI
//
//  Created by hyunwoo on 6/3/25.
//
import SwiftUI

struct TopView: View {
    let tops: [TopModel]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("오늘의 티빙 TOP 20")
                .font(.headline)
                .bold()
                .foregroundColor(.black)
                .padding(.leading, 12)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 5){
                    ForEach(tops) { top in
                        TopCellView(top: top)
                    }
                }
                .padding(.horizontal,16)
            }
        }
        .frame(height: 130)
    }
}

#Preview {
    TopView(tops: topDummy)
}
