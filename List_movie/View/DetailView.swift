//
//  DetailView.swift
//  List_movie
//
//  Created by MobApp on 20/06/23.
//

import SwiftUI

struct DetailView: View {
    let item: Result
    @ObservedObject var controller = DetailMovieVM()
    
    func listGenres(genres: [Genre]) -> String{
        var genreName: [String] = []
        for i in genres{
            genreName.append(i.name)
        }
        return String (genreName.joined(separator: " • "))
    }
    
    func minToHours(duration: Int) -> String {
        var hour = duration / 60
        var min = duration % 60
        
        return "\(hour)h \(min)m"
    }
    
    var body: some View {
            Color(UIColor(red: 49/255, green: 29/255, blue: 63/255, alpha: 1.0))
                .ignoresSafeArea()
                .overlay{
                    VStack(alignment: .leading){
                        ZStack{
                            AsyncImage(url: URL(string: controller.imgUrl + controller.detailMovie.backdropPath), scale: 3){
                                image in image
                            }placeholder: {
                                Image("default-image")
                                    .resizable()
                                    .frame(maxHeight: 240)
                                    .scaledToFill()
                            }.frame(minWidth: 200)
                            
                        }
                        .overlay(
                            HStack{
                                VStack(alignment: .leading) {
                                    Text(controller.detailMovie.title)
                                        .font(.title)
                                        .padding(.leading, 6)
                                        .foregroundColor(.white)
                                    Text(listGenres(genres:controller.detailMovie.genres) + " | " + minToHours(duration: controller.detailMovie.runtime))
                                        .font(.headline)
                                        .padding(.leading, 6)
                                        .foregroundColor(.gray)
                                }.multilineTextAlignment(.leading)
                                Spacer()
                            }
                                .background(LinearGradient(colors: [Color(UIColor(red: 49/255, green: 29/255, blue: 63/255, alpha: 1.0)), Color(UIColor(red: 49/255, green: 29/255, blue: 63/255, alpha: 0.7)), Color(UIColor(red: 49/255, green: 29/255, blue: 63/255, alpha: 0.3)), Color.clear], startPoint: .bottom, endPoint: .top)), alignment: .bottomLeading)
                        Spacer().frame(height: 16)
                        HStack(alignment: .top){
                            ZStack{
                                Circle()
                                    .stroke(lineWidth: 8)
                                    .foregroundColor(.white)
                                
                                Circle()
                                    .trim(from: 0, to: controller.detailMovie.voteAverage/10)
                                    .stroke(style: StrokeStyle(lineWidth: 7, lineCap: .round))
                                    .rotationEffect(Angle(degrees: -90))
                                    .foregroundColor(Color(uiColor: UIColor(red: 226/255, green: 62/255, blue: 87/255, alpha: 1)))
                                    .animation(.easeOut(duration: 1), value:controller.detailMovie.voteAverage/10 )
                                Text("\(String(format: "%.0f", (controller.detailMovie.voteAverage * 10)))%")
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                
                            }
                            .padding(16)
                            .frame(width: 100)
                            Spacer()
                            Text(controller.detailMovie.overview)
                                .font(.caption)
                                .foregroundColor(.white)
                                .padding(6)
                            
                        }
                        Spacer()
                    }.onAppear{
                        controller.getDetail(id: item.id)
                    }
                }
        }
    }
