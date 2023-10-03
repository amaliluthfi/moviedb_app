//
//  detailMovieList.swift
//  List_movie
//
//  Created by MobApp on 29/09/23.
//

import SwiftUI

struct DetailMovieList: View {
    var category: String = "now_playing"
    
    func getCategoryName(categoryName: String) -> String {
        switch categoryName {
        case "now_playing":
            return "Now Playing"
        case "popular":
            return "Popular"
        default:
            return ""
        }
    }
    @ObservedObject var controller = DetailMovieListVM()
    var body: some View {
            Color(UIColor(red: 49/255, green: 29/255, blue: 63/255, alpha: 1.0))
                .ignoresSafeArea()
                .overlay(
                    ScrollView(.vertical, showsIndicators: false){
                        LazyVStack(alignment: .leading, spacing: 16){
                            ForEach(0..<controller.movieList.results.count, id: \.self){
                                i in NavigationLink(destination: DetailView(item: controller.movieList.results[i])){
                                    HStack(alignment: .top) {
                                        AsyncImage(url: URL(string: controller.imgUrl + (controller.movieList.results[i].posterPath ?? "")), scale: 10).cornerRadius(8).frame(width: 130, height: 190)
                                        Spacer().frame(width: 8)
                                        VStack(alignment: .leading) {
                                            Text((controller.movieList.results[i].originalTitle ?? ""))
                                                .lineLimit(2)
                                                .multilineTextAlignment(.leading)
                                                .font(.title2)
                                            .foregroundColor(Color.white)
                                            Text((controller.movieList.results[i].overview ?? ""))
                                                .lineLimit(3)
                                                .multilineTextAlignment(.leading)
                                                .font(.caption)
                                                .foregroundColor(Color.white)
                                            Spacer().frame(height: 8)
                                            HStack{
                                                Text("\(String(format: "%.0f", ((controller.movieList.results[i].voteAverage ?? 0) * 10)))%").foregroundColor(Color.white)
                                                Image(systemName: "star.fill").foregroundColor(Color.yellow)
                                                
                                            }
                                        }
                                        
                                    }.onAppear{
                                        
                                        if(!controller.isLoadMore && i == (controller.movieList.results.count-1)){
                                            print("ini load more 1")
                                            controller.loadMore(category: category)
                                        }
                                    }
                                }
                            }.padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                        }
                    }
                
                ).toolbar(content: {
            ToolbarItem(placement: .principal){
                Text(getCategoryName(categoryName: category)).font(.title).foregroundColor(Color.white).bold()
            }
            
        })
        .toolbarBackground(Color(UIColor(red: 49/255, green: 29/255, blue: 63/255, alpha: 1.0)),for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .onAppear{
            controller.getMovieList(category: category)
        }
    }
}


