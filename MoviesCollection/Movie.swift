//
//  Movie.swift
//  MoviesCollection
//
//  Created by Joao Leal on 9/4/24.
//

import Foundation
import SwiftData

@Model
class Movie{
    @Attribute(.unique) var title: String
    var year: String
    var country: String
    var director: String
    var dateAdded: Date
    var review: String?
    var rating: Int?
    init(
        title: String,
        year: String,
        country: String,
        director: String,
        dateAdded: Date = Date.now,
        review: String? = nil,
        rating: Int? = nil
    ) {
        self.title = title
        self.year = year
        self.country = country
        self.director = director
        self.dateAdded = dateAdded
        self.review = review
        self.rating = rating
    }
}

