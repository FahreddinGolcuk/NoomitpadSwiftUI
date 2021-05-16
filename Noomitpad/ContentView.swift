//
//  ContentView.swift
//  Noomitpad
//
//  Created by Fahreddin Gölcük on 15.05.2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var booksViewModel = BooksViewModel()
    var body: some View {
        TabView{
            MainView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Main")
                }
            BooksView()
                .tabItem {
                    Image(systemName: "book")
                    Text("Books")
                }
            NewBookView()
                .tabItem {
                    Image(systemName: "plus.square")
                    Text("New Book")
                }
        }.environmentObject(booksViewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
