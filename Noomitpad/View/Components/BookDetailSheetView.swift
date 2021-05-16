//
//  BookDetailSheetView.swift
//  Noomitpad
//
//  Created by Fahreddin Gölcük on 15.05.2021.
//

import SwiftUI

struct BookDetailSheetView: View {
    var book: Book
    @Binding var showingSheet: Bool
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Button(action: {
                    self.showingSheet.toggle()
                }, label: {
                    Image(systemName: "xmark.circle")
                        .resizable()
                        .frame(width: 36, height: 36)
                })
                .padding()
            }
            Spacer()
            VStack{
                Text(book.author)
                Text("\(book.endTime)")
                Text("\(book.startTime)")
                
            }
            Spacer()
        }
    }
}

struct BookDetailSheetView_Previews: PreviewProvider {
    static var previews: some View {
        BookDetailSheetView(book: Book(id: "3", name: "", author: "", page: 4, subject: "", startTime: Date(), endTime: Date(), starRate: 4), showingSheet: .constant(false))
    }
}
