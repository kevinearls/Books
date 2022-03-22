//
//  Book.swift
//  ReadMe
//
//  Created by Kevin Earls on 19/03/2022.
//

struct Book: Hashable {
    let title: String
    let author: String
    
    init(title: String = "Title", author: String = "Author") {
        self.title = title
        self.author = author
    }

}
