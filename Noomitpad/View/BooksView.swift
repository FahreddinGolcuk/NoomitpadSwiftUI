//
//  BooksView.swift
//  Noomitpad
//
//  Created by Fahreddin Gölcük on 15.05.2021.
//

import SwiftUI

struct BooksView: View {
    @EnvironmentObject var booksViewModel: BooksViewModel
    var body: some View{
        List{
            ForEach(booksViewModel.books, id: \.self) { (item) in
                BookListItemView(book: item)
            }
        }
    }
}

