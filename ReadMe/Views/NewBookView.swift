//
//  NewBookView.swift
//  ReadMe
//
//  Created by Kevin Earls on 26/03/2022.
//

import SwiftUI

struct NewBookView: View {
  @ObservedObject var book = Book(title: "", author: "", microReview: "", readMe: true)
  @State var image: Image? = nil
  @EnvironmentObject var library: Library
  
  var body: some View {
    NavigationView {
      VStack {
        VStack(spacing: 24) {
          TextField("Title", text: $book.title)
          Divider().padding(.vertical)
          TextField("Author", text: $book.author)
          ReviewAndImageStack(book: book, image: $image)
        }
        .padding()
        .navigationTitle("Got a new book?")
        .toolbar {
          ToolbarItem(placement: .status) {
            Button("Add to Library") {
              library.addNewBook(book, image: image)
            }
          }
        }
      }
    }
  }
}

struct NewBookView_Previews: PreviewProvider {
  static var previews: some View {
    NewBookView().environmentObject(Library())
  }
}
