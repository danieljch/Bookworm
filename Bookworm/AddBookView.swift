//
//  AddBookView.swift
//  Bookworm
//
//  Created by Daniel Jesus Callisaya Hidalgo on 2/3/22.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = ""
    @State private var review = ""
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    var saveButtonIsEnabled : Bool {
        if title.isEmpty || author.isEmpty {
            return false
        }
        return true
    }
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name of book, required", text: $title)
                    TextField("Author's name, required", text: $author)

                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }

                Section {
                    TextEditor(text: $review)

                    RatingView(rating: $rating)
                    
                } header: {
                    Text("Write a review")
                }

                Section {
                    Button("Save") {
                        let newBook = Book(context: moc)
                        newBook.id = UUID()
                        newBook.title = title
                        newBook.author = author
                        newBook.rating = Int16(rating)
                        
                        if !genre.isEmpty {
                            newBook.genre = genre
                        } else {
                            newBook.genre = "Unknown"
                        }
                        newBook.review = review
                        
                        try? moc.save()
                        dismiss()
                    }.disabled(saveButtonIsEnabled == false)
                }
            }
            .navigationTitle("Add Book")
        }
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
