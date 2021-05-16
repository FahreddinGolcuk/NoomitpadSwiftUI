//
//  NewBookView.swift
//  Noomitpad
//
//  Created by Fahreddin Gölcük on 15.05.2021.
//

import SwiftUI

struct NewBookView: View {
    @State private var presented: Bool = false
    @State var image: UIImage?
    @State private var name: String = ""
    @State private var author: String = ""
    @State private var page: String = ""
    @State private var subject: String = ""
    @State private var startTime: Date = Date()
    @State private var endTime: Date = Date()
    @State private var starRate: Int = 1
    @EnvironmentObject var booksViewModel: BooksViewModel
    var body: some View {
        VStack {
            if((image == nil)){
                Circle()
                    .padding()
                    .shadow(color: .black, radius: 5)
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }else {
                Image(uiImage: image!)
                    .resizable()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
            }
            Button(action: {
                withAnimation {
                    self.presented.toggle()
                }
            }, label: {
                Text("Image Pick")
            })
            .sheet(isPresented: $presented){
                OpenGallery(isShown: $presented, image: $image)
            }
            CustomTextField(title: "name", iconName: "house", state: $name)
            CustomTextField(title: "author", iconName: "house", state: $author)
            CustomTextField(title: "page", iconName: "book", state: $page)
            CustomTextField(title: "subject", iconName: "house", state: $subject)
            DatePicker("Start Date", selection: $startTime)
            DatePicker("End Date", selection: $startTime)
            RateView(count: $starRate)
            Button(action: {
                self.booksViewModel.addBook(book: Book(name: name, author: author, page:Int(page) ?? 0, subject: subject, startTime: startTime, endTime: endTime, starRate: starRate))
            }){
                Text("SAVE")
            }
        }.animation(.spring())
    }
}

struct NewBookView_Previews: PreviewProvider {
    static var previews: some View {
        NewBookView()
    }
}

