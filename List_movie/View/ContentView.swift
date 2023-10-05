import SwiftUI

struct ContentView: View {
    @ObservedObject var controller = MovieVM()
    @State private var selectedTab = 0
    
    var body: some View {
        NavigationView{
            Color(UIColor(red: 49/255, green: 29/255, blue: 63/255, alpha: 1.0))
                .ignoresSafeArea()
                .overlay(
                    VStack(alignment: .leading){
                        if !controller.nowPlayData.results.isEmpty {
                            ZStack(alignment:.bottomLeading){
                                
                                TabView(selection: $selectedTab) {
                                    
                                    AsyncImage(url: URL(string: controller.imgUrl + (controller.nowPlayData.results[0].backdropPath ?? "")), scale: 3).frame(minWidth: .infinity).scaledToFit().tag(0)
                                    
                                    
                                    AsyncImage(url: URL(string: controller.imgUrl + (controller.nowPlayData.results[1].backdropPath ?? "")), scale: 3).frame(minWidth: .infinity).scaledToFit().tag(1)
                                    
                                    
                                    AsyncImage(url: URL(string: controller.imgUrl + (controller.nowPlayData.results[2].backdropPath ?? "")), scale: 3).frame(minWidth:
                                            .infinity).scaledToFit().tag(2)
                                    
                                }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                            }.overlay(
                                HStack{
                                    Text((controller.nowPlayData.results[selectedTab].title ?? ""))
                                        .font(.title)
                                        .padding(6)
                                        .foregroundColor(.white)
                                    Spacer()
                                }.multilineTextAlignment(.leading)
                                    .frame(maxWidth: .infinity)
                                    .background(LinearGradient(colors: [Color(UIColor(red: 49/255, green: 29/255, blue: 63/255, alpha: 1.0)), Color(UIColor(red: 49/255, green: 29/255, blue: 63/255, alpha: 0.6)), Color.clear], startPoint: .bottom, endPoint: .top)), alignment: .bottomLeading)
                        }
                        Spacer().frame(height: 16)
                        HStack{
                            Text("Now playing")
                                .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                                .foregroundColor(Color.white)
                                .font(.headline)
                            Spacer()
                            NavigationLink(destination: DetailMovieList(category: "now_playing")){
                                HStack(alignment: .center){
                                    Text("See more")
                                        .foregroundColor(Color.white)
                                        .font(.headline)
                                    Image(systemName: "chevron.forward.circle").foregroundColor(Color.white)
                                }.padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                                
                            }
                            
                        }
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack(alignment: .top, spacing: 15){
                                ForEach(controller.nowPlayData.results, id: \.id){
                                    item in NavigationLink(destination: DetailView(item: item)){
                                        AsyncImage(url: URL(string: controller.imgUrl + (item.posterPath ?? "")), scale: 10).cornerRadius(8).frame(width: 130, height: 190).scaledToFit()
                                    }
                                }
                            }
                        }
                        Spacer().frame(height: 8)
                        HStack{
                            Text("Popular")
                                .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                                .foregroundColor(Color.white)
                                .font(.headline)
                            Spacer()
                            NavigationLink(destination: DetailMovieList(category: "popular")){
                                HStack(alignment: .center){
                                    Text("See more")
                                        .foregroundColor(Color.white)
                                        .font(.headline)
                                    Image(systemName: "chevron.forward.circle").foregroundColor(Color.white)
                                }.padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                                
                            }
                            
                        }
                        ScrollView(.horizontal, showsIndicators: false){
                            
                            HStack(alignment: .top, spacing: 15){
                                ForEach(controller.popularData.results, id: \.id){
                                    item in NavigationLink(destination: DetailView(item: item)){
                                        AsyncImage(url: URL(string: controller.imgUrl + (item.posterPath ?? "")), scale: 10).cornerRadius(8).frame(width: 130, height: 190).scaledToFit()
                                    }
                                }
                            }
                        }
                    }
                        .toolbarBackground(Color(uiColor: UIColor(red: 226/255, green: 62/255, blue: 87/255, alpha: 1)), for: .navigationBar)
                        .toolbarBackground(.visible)
                        .toolbar(content: {
                            ToolbarItem(placement: .navigationBarLeading){
                                HStack {
                                    
                                    Image("image").resizable().frame(width: 32.0, height: 32.0)
                                    
                                    Spacer()
                                    Text("MovieDB").font(.largeTitle).foregroundColor(Color.white).bold()
                                }
                                
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
