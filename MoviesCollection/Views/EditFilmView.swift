//
//  EditFilmView.swift
//  MoviesCollection
//
//  Created by Joao Leal on 9/4/24.
//

import SwiftUI

struct EditFilmView: View {
    @Environment(\.dismiss) var dismiss
    let film: Movie
    @State private var title = ""
    @State private var year = ""
    @State private var country = ""
    @State private var director = ""
    @State private var dateAdded = Date.distantPast
    @State private var review = ""
    @State private var rating: Int?
    var body: some View {
        NavigationStack{
            Form{
                Section(header: Text("Film Details")) {
                    TextField("Title", text: $title)
                    TextField("Year", text: $year)
                        .keyboardType(.numberPad)
                    TextField("Country", text: $country)
                    TextField("Director", text: $director)
                    Text("Review")
                    TextEditor(text: $review)
                        .padding(5)
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color(uiColor: .tertiarySystemFill), lineWidth: 2))
                    
                }
                Divider()
                LabeledContent{
                    RatingsView(maxRating: 5, currentRating: $rating, width: 30)
                } label: {
                    Text("Rating")
                }
            }
    }
        .toolbar {
            Button("Update"){
                film.title = title
                film.year = year
                film.director = director
                film.dateAdded = dateAdded
                film.country = country
                film.review = review
                film.rating = rating
                dismiss()
            }
            .onAppear {
                title = film.title
                year = film.year
                country = film.country ?? ""
                director = film.director ?? ""
                dateAdded = film.dateAdded
                review = film.review ?? ""
                rating = film.rating
            }
        }
}
}
//#Preview {
//    let preview = Preview(Movie.self)
//    return NavigationStack{
//        EditFilmView(film: Movie.sampleFilms[3])
//            .modelContainer(preview.container)
//    }
//}
