import Foundation

class DetailMovieVM: ObservableObject {
    @Published var imgUrl = "https://image.tmdb.org/t/p/w1280"
    static let url: String = "https://api.themoviedb.org/3"
    static let apiKey: String = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5MGZiNjE2MjFjYTk1NzljNzU5NDcyMTYyZTM0MGJkMCIsInN1YiI6IjYwMjVlYjYxOWQyYjYzMDAzZjY4MWUzMSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.EHbgE6HOp06aAUmdPVxu7zjGngZFxXl_p-6MiJM1Pxk"
    
    @Published var detailMovie: DetailMovieModel = DetailMovieModel.init(adult: false, backdropPath: "", belongsToCollection: nil, budget: 0, genres: [], homepage: "", id: 0, imdbId: "", originalLanguage: "", originalTitle: "", overview: "", popularity: 0, posterPath: "", productionCompanies: [], productionCountries: [], releaseDate: "", revenue: 0, runtime: 0, spokenLanguages: [], status: "", tagline: "", title: "", video: false, voteAverage: 0, voteCount: 0)
    
    @Published var credits: Credits = Credits(id: 0, cast: [], crew: [])
    @Published var recommendations: NowPlaying = NowPlaying.init(dates: .init(maximum: "", minimum: ""), page: 0, results: [], totalPages: 0, totalResults: 0)
    
    
    func getDetail(id: Int){
        let path: String = "/movie/\(id)"
        
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
                                self.detailMovie = try decoder.decode(DetailMovieModel.self, from: data)
                                
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
    
    
    func getCredits(id: Int){
        let path: String = "/movie/\(id)/credits"
        
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
                                self.credits = try decoder.decode(Credits.self, from: data)                                
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
    
    func getRecommendation(id: Int){
        let path: String = "/movie/\(id)/recommendations"
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
                                self.recommendations = try decoder.decode(NowPlaying.self, from: data)
                                
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




