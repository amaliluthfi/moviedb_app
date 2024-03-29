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
        let headers = [
            "accept": "application/json",
            "Authorization": "Bearer \(Self.apiKey)"
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: Self.url + path)! as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error as Any)
            } else {
                let httpResponse = response as? HTTPURLResponse
                if httpResponse?.statusCode == 200 {
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
        })
        dataTask.resume()
    }
    
    func getPopular(){
        let path: String = "/movie/popular"
        let headers = [
            "accept": "application/json",
            "Authorization": "Bearer \(Self.apiKey)"
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: Self.url + path)! as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error as Any)
            } else {
                let httpResponse = response as? HTTPURLResponse
                if httpResponse?.statusCode == 200 {
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
        })
        dataTask.resume()
    }
    
}
