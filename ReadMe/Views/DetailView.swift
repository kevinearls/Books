//
//  DetailView.swift
//  ReadMe
//
//  Created by Kevin Earls on 19/03/2022.
//

import class PhotosUI.PHPickerViewController
import SwiftUI

struct DetailView: View {
    let book: Book
    @Binding var image: Image?
    @State var showingImagePicker=false
    @State var showingConfirmationDialog=false
    
    var body: some View {
        VStack(alignment: .leading) {
            TitleAndAuthorStack(book: book, titleFont: .title, authorFont: .title2)
            VStack {
                Book.Image(image: image, title: book.title, cornerRadius: 15.0)
                HStack {
                    if image != nil {
                        Spacer()
                        Button("Update Image...") {
                            showingImagePicker = true
                        }
                    }
                    Spacer()
                    Button("Delete Image") {
                        showingConfirmationDialog = true
                    }
                    Spacer()
                }
                .padding()
            }
            Spacer()
        
        }
        .padding()
        .sheet(isPresented: $showingImagePicker) {
            PHPickerViewController.View(image: $image)
        }
        .confirmationDialog("Delete image for \(book.title)?", isPresented: $showingConfirmationDialog) {
            Button("Delete", role: .destructive) { image = nil }
        } message: {
            Text("Delete image for \(book.title)?")
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(book: .init(), image: .constant(nil))
    }
}
