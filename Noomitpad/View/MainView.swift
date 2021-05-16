//
//  MainView.swift
//  Noomitpad
//
//  Created by Fahreddin Gölcük on 15.05.2021.
//

import SwiftUI
import Combine
struct MainView: View {
    @State private var presented: Bool = false
    @State var image: UIImage?
    var body: some View{
        VStack{
            Button(action: {
                withAnimation {
                    self.presented.toggle()
                }
            }, label: {
                Text("BUTTON PICKER")
            })
            .sheet(isPresented: $presented){
                OpenGallery(isShown: $presented, image: $image)
            }
        }
    }
}
