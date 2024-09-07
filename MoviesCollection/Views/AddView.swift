//
//  AddView.swift
//  MoviesCollection
//
//  Created by Joao Leal on 9/4/24.
//

import SwiftUI

struct AddView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) var dismiss
    @State private var title = ""
    @State private var year = ""
    
    var body: some View {
        NavigationStack{
            Form{
                Section(header: Text("Film Details")) {
                    TextField("Title", text: $title)
                    TextField("Year", text: $year)
                        .keyboardType(.numberPad)
           
                }
                Section{
                    HStack{
                       
                        Button {
                            let newFilm = Movie(title: title, year: year)
                            context.insert(newFilm)
                            dismiss()
                        }
                        label: {
                            HStack{
                                Spacer()
                                Text("Save")
                                Spacer()
                            }
                        }
                        .disabled(title.isEmpty || year.isEmpty )         .buttonStyle(.borderless)
                        .listRowBackground(Color.secondary)
                    }
                }
                
            }
            .navigationTitle("Add Film")
            .navigationBarTitleDisplayMode(.inline)
            .frame(maxWidth: 400)
            
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .controlSize(.small)
                }
            }
        }
    }}
#Preview {
    AddView()
}
