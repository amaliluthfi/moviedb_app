//
//  ContentView.swift
//  List_movie
//
//  Created by MobApp on 24/05/23.
//

import SwiftUI

struct ContentView: View {
   @ObservedObject var controller = MovieVM()
    

    
    var body: some View {
        NavigationView{
            Color(UIColor(red: 49/255, green: 29/255, blue: 63/255, alpha: 1.0))
                .ignoresSafeArea()
                .overlay(
                    
                    VStack(alignment: .leading){
                        Text("Now playing")
                            .foregroundColor(Color.white)
                            .font(.headline)
                        ScrollView(.horizontal, showsIndicators: false){
                            
                            HStack(alignment: .top, spacing: 15){
                                ForEach(controller.nowPlayData, id: \.id){
                                    item in AsyncImage(url: URL(string: controller.imgUrl + item.posterPath), scale: 10).cornerRadius(8).frame(width: 120, height: 220).scaledToFit()
                                    
                                    
                                }
                            }
                        }
                        Spacer().frame(height: 16)
                        Text("Popular")
                            .foregroundColor(Color.white)
                            .font(.headline)
                        ScrollView(.horizontal, showsIndicators: false){
                            
                            HStack(alignment: .top, spacing: 15){
                                ForEach(controller.nowPlayData, id: \.id){
                                    item in AsyncImage(url: URL(string: controller.imgUrl + item.posterPath), scale: 10).cornerRadius(8).frame(width: 120, height: 220).scaledToFit()
                                    
                                    
                                }
                            }
                        }
                    }.padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                        .toolbarBackground(Color(uiColor: UIColor(red: 226/255, green: 62/255, blue: 87/255, alpha: 1)), for: .navigationBar)
                        .toolbarBackground(.visible)
                        .toolbar(content: {
                            ToolbarItem(placement: .navigationBarLeading){
                                Text("MovieDB").font(.largeTitle).foregroundColor(Color.white)
                                
                            }
                            ToolbarItem(placement: .navigationBarTrailing){
                                Button(action: {}, label: {
                                    Image(systemName: "magnifyingglass").foregroundColor(Color.white)
                                })
                                
                            }
                        })
                )}

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
