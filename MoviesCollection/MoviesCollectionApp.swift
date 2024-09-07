//
//  MoviesCollectionApp.swift
//  MoviesCollection
//
//  Created by Joao Leal on 9/4/24.
//

import SwiftUI
import SwiftData

@main
struct MoviesCollectionApp: App {
    let container: ModelContainer
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        // .modelContainer(for: [Movie.self, Genre.self])
        .modelContainer(container)
    }
    
    init(){
        let schema = Schema([Movie.self])
        let config = ModelConfiguration("MovieCollection", schema: schema)
        do{
            container = try ModelContainer(for: schema, configurations: config)
        } catch {
            fatalError("Could not configure the container")
        }
    }
}
