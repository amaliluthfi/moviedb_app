//
//  DetailMovieListVM.swift
//  List_movie
//
//  Created by MobApp on 29/09/23.
//

import Foundation

class DetailMovieListVM: ObservableObject{
    @Published var imgUrl = "https://image.tmdb.org/t/p/w1280"
    static let url: String = "https://api.themoviedb.org/3"
    static let apiKey: String = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5MGZiNjE2MjFjYTk1NzljNzU5NDcyMTYyZTM0MGJkMCIsInN1YiI6IjYwMjVlYjYxOWQyYjYzMDAzZjY4MWUzMSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.EHbgE6HOp06aAUmdPVxu7zjGngZFxXl_p-6MiJM1Pxk"
    
    @Published var movieList: NowPlaying = NowPlaying.init(dates: .init(maximum: "", minimum: ""), page: 0, results: [], totalPages: 0, totalResults: 0)
    @Published var isLoadMore = false
    static var page = 1
    
    func getMovieList(category: String){
        let path: String = "/movie/\(category)"
        Self.page = 1
        
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
                                self.movieList = try decoder.decode(NowPlaying.self, from: data)
                                
                            } catch let error {
                                print("Error decoding: ", error)
                            }
                        }
                    }
                }
            }
        })
        dataTask.resume()
        
        Self.page+=1
    }
    
    func loadMore(category: String){
        isLoadMore = true
        let path: String = "/movie/\(category)"
        
        let headers = [
          "accept": "application/json",
          "Authorization": "Bearer \(Self.apiKey)"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: Self.url + path + "?page=" + String(Self.page))! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
          if (error != nil) {
            print(error as Any)
          } else {
            let httpResponse = response as? HTTPURLResponse
              if(httpResponse?.statusCode == 200){
                  if let data = data {
                      DispatchQueue.main.async {
                          do{
                              let decoder = JSONDecoder()
                              decoder.keyDecodingStrategy = .convertFromSnakeCase
                              
                              let listData = try decoder.decode(NowPlaying.self, from: data)
                              self.movieList.results.append(contentsOf: listData.results)
                              
                          } catch let error {
                              print("Error decoding: ", error)
                          }
                      }
                  }
              }
          }
        })

        dataTask.resume()
        
        Self.page += 1
        isLoadMore = false
        
        
        
    }
}
