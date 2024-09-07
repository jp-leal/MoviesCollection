//
//  PreviewContainer.swift
//  MoviesCollection
//
//  Created by Joao Leal on 9/4/24.
//

import Foundation
import SwiftData

@MainActor
class SampleData{
    static let shared = SampleData()
    let container: ModelContainer
    
    var context: ModelContext{
        container.mainContext
    }
    
    private init(){
        let schema = Schema([Movie.self])
        let config = ModelConfiguration("MovieCollection", schema: schema, isStoredInMemoryOnly: true)
        do{
            container = try ModelContainer(for: schema, configurations: [config])
            insertSampleData()
        } catch {
            fatalError("Could not configure the container")
        }
    }
    
   private func insertSampleData(){
        for movie in Movie.sampleFilms{
            context.insert(movie)
        }
        do{
        try context.save()
        } catch{
            print("Sample data context failed to save")
        }
        
        }
}

//struct Preview{
//    let container: ModelContainer
//    init(_ models: any PersistentModel.Type...){
//        let config = ModelConfiguration(isStoredInMemoryOnly: true)
//        let schema = Schema(models)
//        do{
//            container = try ModelContainer(for: schema, configurations: config)
//        } catch{
//            fatalError("Could not")
//        }
//    }
//    
//    func addExamples(_ examples:[any PersistentModel]) {
//        Task{ @MainActor in
//            examples.forEach { example in
//                container.mainContext.insert(example)
//            }
//        }
//    }
//}
