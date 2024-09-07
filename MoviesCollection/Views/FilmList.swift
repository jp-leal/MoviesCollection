//
//  FilmList.swift
//  MoviesCollection
//
//  Created by Joao Leal on 9/4/24.
//

import SwiftUI
import SwiftData

struct FilmList: View {
    @Query private var films: [Movie]
    
    init(sortOrder: SortOrder){
        let sortDescriptors: [SortDescriptor<Movie>] = switch sortOrder {
        case .title:
            [SortDescriptor(\Movie.title)]
        case .year:
            [SortDescriptor(\Movie.year)]
            
        }
        _films = Query(sort: sortDescriptors)
    }
    
    @Environment(\.modelContext) private var context
    var body: some View {
        Group{
            if films.isEmpty{
                ContentUnavailableView("Add your first film", systemImage: "film.fill")
            } else {
                List{
                    ForEach(films){ film in
                        NavigationLink{
                            EditFilmView(film: film)
                        } label:{
                            HStack{
                                Text(film.title)
                                Text("(\(film.year))")
                                    .textScale(.secondary)
                                    .foregroundStyle(.secondary)
                                if let rating = film.rating{
                                    HStack{
                                        ForEach(1..<rating, id: \.self){
                                            _ in
                                            Image(systemName: "star.fill")
                                                .imageScale(.small)
                                                .foregroundStyle(.yellow)
                                        }
                                    }
                                }
                            }
                        }
                        
                        
                    }
                    .onDelete { indexSet in
                        indexSet.forEach { index in
                            let film = films[index]
                            context.delete(film)
                        }
                    }
                }
                .listStyle(.plain)
                
            }
        }
    }
}

//#Preview {
//    let preview = Preview(Movie.self)
//    preview.addExamples(Movie.sampleFilms)
//    return NavigationStack{
//        FilmList(sortOrder: .title)
//    }
//    .modelContainer(preview.container)
//}
