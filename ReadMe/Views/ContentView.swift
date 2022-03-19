//
//  ContentView.swift
//  ReadMe
//
//  Created by Kevin Earls on 18/03/2022.
//

import SwiftUI

struct ContentView: View {
    let book = Book(title: "Something with Swift", author: "Cattie Caterwaul")  // TODO remove this

    var body: some View {
        BookRow(book: book)  // TODO replace book with .init
    }
}

struct BookRow: View {
    let book: Book
    var body: some View {
        HStack {
            Book.Image(title: book.title)
            VStack(alignment: .leading) {
                Text(book.title)
                    .font(.title2)
                Text(book.author)
                    .font(.title3)
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


