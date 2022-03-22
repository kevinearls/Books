//
//  ContentView.swift
//  ReadMe
//
//  Created by Kevin Earls on 18/03/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List(Library().sortedBooks, id: \.self) { book in
                BookRow(book: book)
            }
            .navigationTitle("My Library")
        }
    }
}

struct BookRow: View {
    let book: Book
    var body: some View {
        NavigationLink(destination: DetailView(book: book)) {
            HStack {
                Book.Image(title: book.title, size: 80)
                TitleAndAuthorStack(book: book, titleFont: .title2, authorFont: .title3)
                    .lineLimit(1)
            }
            .padding(.vertical)
            .frame(width: 300, height: 80, alignment: .leading)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

