//
//  ContentView.swift
//  TvingSwiftUI
//
//  Created by hyunwoo on 5/26/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Image("Logo2")
                    .resizable()
                    .frame(width: 191, height: 78)
                
                Spacer()

                Image("Search")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .padding(.trailing, 8)

                Image("Logo3")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .padding(.trailing, 8)
            }
            .padding(.top, 25)
            .background(Color.black)
            
            ScrollView {
                VStack(spacing: 30) {
                    TopView(tops: topDummy)
                    LiveView(lives: liveDummy)
                    LiveMovieView(livemovies: livemoiveDummy)
                    BaseBallView(balls: baseballDummy)
                    SportsView(sports: sportsDummy)
                    FavoriteView(favorites: favoriteDummy)
                }
            }
            .background(Color.black)
        }
        .edgesIgnoringSafeArea(.top)
        .background(Color.black)
    }
}

#Preview {
    ContentView()
}

