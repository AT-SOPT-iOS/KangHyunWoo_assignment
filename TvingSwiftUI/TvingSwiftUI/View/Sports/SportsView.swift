//
//  SportsView.swift
//  TvingSwiftUI
//
//  Created by hyunwoo on 5/29/25.
//
import SwiftUI

struct SportsView: View {
    let sports: [SportsModel]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 5){
                ForEach(sports) { sport in
                    SportsCellView(sport: sport)
                }
            }
            .padding(.horizontal,8)
        }
        .frame(height: 45)
    }
}

#Preview {
    SportsView(sports: sportsDummy)
}

