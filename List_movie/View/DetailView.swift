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
        let hour = duration / 60
        let min = duration % 60
        
        return "\(hour)h \(min)m"
    }
    
    func getDirector(crews: [Cast]) -> Cast{
        var output: Cast = Cast(adult: false, gender: 0, id: 0, knownForDepartment: "", name: "", originalName: "", popularity: 0.0, castID: 0, creditID: "", department: "")
        
        for el in crews {
            if el.job == "Director" {
                output = el
            }
        }
        return output
    }
    
    func getWriters(crews: [Cast]) -> String{
        var output: [String] = []
        
        for el in crews {
            if el.job == "Screenplay" {
                print("ini nama")
                output.append(el.name)
            }
        }
        
        return String(output.joined(separator: ", "))
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
                    Spacer().frame(height: 8)
                    HStack{
                        VStack(alignment: .leading) {
                            Text("Director")
                                .foregroundColor(Color.white)
                                .font(.headline)
                            Text("\(getDirector(crews: controller.credits.crew).name)")
                                .foregroundColor(Color.white)
                                .font(.caption)
                                .lineLimit(1)
                            
                        }
                        Spacer().frame(width: 12)
                        if getWriters(crews: controller.credits.crew) != ""{
                            VStack(alignment: .leading) {
                                Text("Screenplay")
                                    .foregroundColor(Color.white)
                                    .font(.headline)
                                Text("\(getWriters(crews: controller.credits.crew))")
                                    .foregroundColor(Color.white)
                                    .font(.caption)
                                    .lineLimit(1)
                            }
                            
                        }
                    }.padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                    Spacer().frame(height: 16)
                    if !controller.recommendations.results.isEmpty{
                        Text("Recommendation")
                            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 8))
                            .foregroundColor(Color.white)
                        .font(.headline)}
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(alignment: .top, spacing: 15){
                            ForEach(controller.recommendations.results, id: \.id){
                                item in NavigationLink(destination: DetailView(item: item)){
                                    AsyncImage(url: URL(string: controller.imgUrl + (item.posterPath ?? "")), scale: 10).cornerRadius(8).frame(width: 130, height: 190).scaledToFit()
                                }
                            }
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .onAppear{
                    controller.getDetail(id: item.id)
                    controller.getCredits(id: item.id)
                    controller.getRecommendation(id: item.id)
                }
            }
    }
}
