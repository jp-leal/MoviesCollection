//
//  ContentView.swift
//  MoviesCollection
//
//  Created by Joao Leal on 9/4/24.
//

import SwiftUI
import SwiftData

enum SortOrder: String, Identifiable, CaseIterable{
    case title, year
    
    var id: Self {
        self
    }
}

struct ContentView: View {

    @State private var showAddView = false
    @State private var sortOrder = SortOrder.title
    var body: some View {
        NavigationStack {
            Picker("", selection: $sortOrder) {
                ForEach(SortOrder.allCases) { sortOrder in
                    Text("Sort by\(sortOrder.rawValue)").tag(sortOrder)
                }
            }.buttonStyle(.bordered)
            FilmList(sortOrder: sortOrder)
                
                .navigationTitle("Movie Collection")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    Button {
                        showAddView.toggle()
                    } label: {
                        Image(systemName: "plus.circle.fill")
                        
                    }
                    
                }
                .sheet(isPresented: $showAddView) {
                    AddView()
                        .presentationDetents([.medium])
                }
            
        }
    }
}
#Preview {
    ContentView()
        .modelContainer(SampleData.shared.container)
}

//#Preview {
//    let preview = Preview(Movie.self)
//    preview.addExamples(Movie.sampleFilms)
//    return ContentView()
//        .modelContainer(preview.container)
//}
