//
//  List_movieApp.swift
//  List_movie
//
//  Created by MobApp on 24/05/23.
//

import SwiftUI

@main
struct List_movieApp: App {
    @StateObject var movieController = MovieVM()
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
