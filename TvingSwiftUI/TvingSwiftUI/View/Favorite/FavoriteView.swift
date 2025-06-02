//
//  FavoriteView.swift
//  TvingSwiftUI
//
//  Created by hyunwoo on 6/2/25.
//

import SwiftUI

struct FavoriteView: View {
    let favorites: [FavoriteModel]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("김가현PD의 인생작 TOP 5")
                .font(.subheadline)
                .bold()
                .foregroundColor(.black)
                .padding(.leading, 16)
            
            ScrollView(.horizontal){
                HStack(spacing: 5){
                    ForEach(favorites) { favorite in
                        FavoriteCellView(favorite: favorite)
                    }
                }
                .padding(.horizontal,16)
            }
        }
        .frame(height: 130)
    }
}

#Preview {
    FavoriteView(favorites: favoriteDummy)
}

