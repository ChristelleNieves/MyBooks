//
//  Book.swift
//  MyBooks
//
//  Created by Christelle Nieves on 7/9/21.
//

import Foundation
import UIKit

struct Book {
    let title: String
    let author: String
    
    var image: UIImage {
        Library.loadImage(forBook: self)
        ?? LibrarySymbol.letterSquare(letter: title.first).image
    }
}
