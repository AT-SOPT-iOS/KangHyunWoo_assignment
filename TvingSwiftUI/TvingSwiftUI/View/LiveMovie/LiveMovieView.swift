//
//  LiveMovieView.swift
//  TvingSwiftUI
//
//  Created by hyunwoo on 6/2/25.
//
import SwiftUI

struct LiveMovieView: View {
    let livemovies: [LiveMovieModel]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack{
                Text("실시간 인기 영화")
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(.black)
                    .padding(.leading, 16)
                
                Spacer()
                
                Text("더보기")
                    .font(.caption)
                    .foregroundColor(.gray2)
                    .padding(.trailing, 16)
            }
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 5){
                    ForEach(livemovies) { livemovie in
                        LiveMovieCellView(livemovie: livemovie)
                    }
                }
                .padding(.horizontal,16)
            }
        }
        .frame(height: 190)
    }
}

#Preview {
    LiveMovieView(livemovies: livemoiveDummy)
}

