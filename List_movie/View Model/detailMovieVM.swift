import Foundation

class DetailMovieVM: ObservableObject {
    @Published var imgUrl = "https://image.tmdb.org/t/p/w1280"
    static let url: String = "https://api.themoviedb.org/3"
    static let apiKey: String = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5MGZiNjE2MjFjYTk1NzljNzU5NDcyMTYyZTM0MGJkMCIsInN1YiI6IjYwMjVlYjYxOWQyYjYzMDAzZjY4MWUzMSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.EHbgE6HOp06aAUmdPVxu7zjGngZFxXl_p-6MiJM1Pxk"
    
    @Published var detailMovie: DetailMovieModel = DetailMovieModel.init(adult: false, backdropPath: "", belongsToCollection: nil, budget: 0, genres: [], homepage: "", id: 0, imdbId: "", originalLanguage: "", originalTitle: "", overview: "", popularity: 0, posterPath: "", productionCompanies: [], productionCountries: [], releaseDate: "", revenue: 0, runtime: 0, spokenLanguages: [], status: "", tagline: "", title: "", video: false, voteAverage: 0, voteCount: 0)
    
    init(){
        print("init")
    }
    
    
    func getDetail(id: Int){
        let path: String = "/movie/\(id)"
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
                            self.detailMovie = try decoder.decode(DetailMovieModel.self, from: data)
                            
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
