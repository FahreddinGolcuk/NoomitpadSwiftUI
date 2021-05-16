//
//  RateView.swift
//  Noomitpad
//
//  Created by Fahreddin Gölcük on 15.05.2021.
//

import SwiftUI

struct RateView: View {
   @Binding var count: Int
    var body: some View{
        HStack{
            ForEach((1...5), id: \.self) {item in
                Button(action: {
                    self.count = item
                }){
                    Image(systemName: count >= item ? "star.fill" : "star")
                }
            }
        }
    }
}

struct RateView_Previews: PreviewProvider {
    static var previews: some View {
        RateView(count: .constant(1))
    }
}
