//
//  ContentView.swift
//  ReadMe
//
//  Created by Kevin Earls on 18/03/2022.
//

import SwiftUI

struct ContentView: View {
  @State var addingNewBook: Bool = false
  @EnvironmentObject var library: Library
  
  var body: some View {
    NavigationView {
      List {
        Button {
          addingNewBook = true
        } label: {
          Spacer()
          VStack(spacing: 6) {
            Image(systemName: "book.circle")
              .font(.system(size: 60))
            Text("Add New Book")
              .font(.title2)
          }
          Spacer()
        }
        .buttonStyle(.borderless)
        .padding(.vertical, 8)
        .sheet(isPresented: $addingNewBook, content: NewBookView.init)
       
        ForEach(Section.allCases, id: \.self) {
          SectionView(section: $0)
        }
      }
      .navigationTitle("My Library")
    }
    
  }
}

struct BookRow: View {
  @ObservedObject var book: Book
  @EnvironmentObject var library: Library
  
  var body: some View {
    NavigationLink(destination: DetailView(book: book)) {
      HStack {
        Book.Image(image: library.images[book], title: book.title, size: 80, cornerRadius: 18.0)
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

private struct SectionView: View {
  let section: Section
  @EnvironmentObject var library: Library
  
  var title: String {
    switch section {
      
    case .readMe:
      return "Read me!!!!"
    case .finished:
      return "Finished!!!"
    }
  }
  
  var body: some View {
    if let books = library.sortedBooks[section] {
      SwiftUI.Section {
        ForEach(books) { book in
          BookRow(book: book)
        }
      }
      header: {
        ZStack {
          Image("BookTexture")
            .resizable()
            .scaledToFit()
          Text(title)
            .font(.custom("American Typewriter", size: 24))
            .foregroundColor(.primary)
        }
        .listRowInsets(.init())
      }
    }
    
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .environmentObject(Library())
  }
}

