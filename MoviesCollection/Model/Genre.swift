//
//  Genre.swift
//  MoviesCollection
//
//  Created by Joao Leal on 9/4/24.
//

import Foundation
import SwiftData

@Model
class Genre {
    var name: String
    var color: String
    var films: [Movie]?
    
    init(name: String, color: String) {
        self.name = name
        self.color = color
    }
}
