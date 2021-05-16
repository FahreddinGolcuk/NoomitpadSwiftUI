//
//  BookListItemView.swift
//  Noomitpad
//
//  Created by Fahreddin Gölcük on 15.05.2021.
//

import SwiftUI

struct BookListItemView: View {
    var book: Book
    @EnvironmentObject var booksViewModel: BooksViewModel
    @State private var showingSheet = false
    var body: some View{
        HStack{
            Text(book.name)
            Text(book.author)
            Button(action: {
                self.showingSheet.toggle()
            }){
                Text("TIKLANDI")
            }
            .background(Color.blue)
            .sheet(isPresented: $showingSheet) {
                BookDetailSheetView(book: book,showingSheet: $showingSheet)
            }
        }
        .padding()
        .background(Color.red)
    }
}

struct BookListItemView_Previews: PreviewProvider {
    static var previews: some View {
        BookListItemView(book: Book(id: "123", name: "123", author: "", page: 5, subject: "", startTime: Date(), endTime: Date(), starRate: 4))
    }
}
