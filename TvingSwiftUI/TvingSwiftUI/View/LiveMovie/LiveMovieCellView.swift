//
//  LiveMovieCellView.swift
//  TvingSwiftUI
//
//  Created by hyunwoo on 6/2/25.
//
import SwiftUI

struct LiveMovieCellView: View {
    let livemovie : LiveMovieModel
    
    var body: some View {
        Image(livemovie.imageName)
            .resizable()
            .frame(width: 98, height: 146)
            .shadow(radius: 3)
    }
}

