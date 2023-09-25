//
//  movie_controller.swift
//  List_movie
//
//  Created by MobApp on 05/06/23.
//

import Foundation

class MovieVM: ObservableObject {
    @Published var imgUrl = "https://image.tmdb.org/t/p/w1280"
    static let url: String = "https://api.themoviedb.org/3"
    static let apiKey: String = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5MGZiNjE2MjFjYTk1NzljNzU5NDcyMTYyZTM0MGJkMCIsInN1YiI6IjYwMjVlYjYxOWQyYjYzMDAzZjY4MWUzMSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.EHbgE6HOp06aAUmdPVxu7zjGngZFxXl_p-6MiJM1Pxk"
    
    @Published var nowPlayData: NowPlaying = NowPlaying.init(dates: .init(maximum: "", minimum: ""), page: 0, results: [], totalPages: 0, totalResults: 0)
    @Published var popularData: NowPlaying = NowPlaying.init(dates: .init(maximum: "", minimum: ""), page: 0, results: [], totalPages: 0, totalResults: 0)
    
    init(){
        getNowPlaying()
        getPopular()
    }
    
    
    func getNowPlaying(){
        let path: String = "/movie/now_playing"
        guard let pathUrl: URL = URL(string: MovieVM.url + path ) else {
            fatalError("Missing URL")
        }
        
        
        var urlRequest = URLRequest(url: pathUrl)
        urlRequest.setValue("Bearer " + MovieVM.apiKey, forHTTPHeaderField: "Authorization")
        urlRequest.setValue("accept", forHTTPHeaderField: "application/json")
        urlRequest.httpMethod = "GET"
        
        let dataTask = URLSession.shared.dataTask(with: urlRequest){
            data, response, error in
            
            if let error = error {
                print("error get", error)
            }
            
            guard let response = response as? HTTPURLResponse else { return }
            
            if response.statusCode == 200 {
                if let data = data {
                    DispatchQueue.main.async {
                        do{
                            let decoder = JSONDecoder()
                            decoder.keyDecodingStrategy = .convertFromSnakeCase

                            self.nowPlayData = try decoder.decode(NowPlaying.self, from: data)
                            
                        } catch let error {
                            print("Error decoding: ", error)
                        }
                    }
                }
            }
            
            
        }
        dataTask.resume()
    }
    
    func getPopular(){
        let path: String = "/movie/popular"
        guard let pathUrl: URL = URL(string: MovieVM.url + path ) else {
            fatalError("Missing URL")
        }
        var urlRequest = URLRequest(url: pathUrl)
        urlRequest.setValue("Bearer " + MovieVM.apiKey, forHTTPHeaderField: "Authorization")
        urlRequest.setValue("accept", forHTTPHeaderField: "application/json")
        urlRequest.httpMethod = "GET"
        
        let dataTask = URLSession.shared.dataTask(with: urlRequest){
            data, response, error in
            
            if let error = error {
                print("error get", error)
            }
            
            guard let response = response as? HTTPURLResponse else { return }
            
            if response.statusCode == 200 {
                if let data = data {
                    DispatchQueue.main.async {
                        do{
                            let decoder = JSONDecoder()
                            decoder.keyDecodingStrategy = .convertFromSnakeCase

                            self.popularData = try decoder.decode(NowPlaying.self, from: data)
                            
                        } catch let error {
                            print("Error decoding: ", error)
                        }
                    }
                }
            }
        }
        dataTask.resume()
    }
    
}
