//
//  FavoriteCellView.swift
//  TvingSwiftUI
//
//  Created by hyunwoo on 6/2/25.
//
import SwiftUI

struct FavoriteCellView: View {
    let favorite : FavoriteModel
    
    var body: some View {
        Image(favorite.imageName)
            .resizable()
            .frame(width: 160, height: 90)
            .shadow(radius: 3)
    }
}
