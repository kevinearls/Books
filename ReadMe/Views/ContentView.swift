//
//  ContentView.swift
//  ReadMe
//
//  Created by Kevin Earls on 18/03/2022.
//

import SwiftUI

struct ContentView: View {
    @State var library = Library()
    var body: some View {
        NavigationView {
            List {
                Button {
                    
                } label: {
                    Spacer()
                    VStack {
                        Image(systemName: "book.circle")
                            .font(.system(size: 60))
                        Text("Add New Book")
                            .font(.title2)
                    }
                    Spacer()
                }
                .buttonStyle(.borderless)
                .padding(.vertical, 8)
                ForEach(library.sortedBooks) { book in
                    BookRow(book: book, image: $library.images[book])
                }
            }
            .navigationTitle("My Library")
        }
    }
}

struct BookRow: View {
    @ObservedObject var book: Book
    @Binding var image: Image?
    
    var body: some View {
        NavigationLink(destination: DetailView(book: book, image: $image)) {
            HStack {
                Book.Image(image: image, title: book.title, size: 80, cornerRadius: 18.0)
                    .scaledToFit()
                VStack(alignment: .leading) {
                    TitleAndAuthorStack(book: book, titleFont: .title2, authorFont: .title3)
                    if !book.microReview.isEmpty {
                        Spacer()
                        Text(book.microReview)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    
                }
                .lineLimit(1)
            }
            .padding(.vertical)
            .frame(width: 300, height: 80, alignment: .leading)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()//.previewedInAllColorSchemes
    }
}

