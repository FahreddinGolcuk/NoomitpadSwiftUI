//
//  CustomTextField.swift
//  Noomitpad
//
//  Created by Fahreddin Gölcük on 15.05.2021.
//

import SwiftUI

struct CustomTextField: View {
    var title: String
    var iconName: String
    @Binding var state: String
    var body: some View{
        HStack{
            Image(systemName: iconName)
            TextField(title, text: $state)
        }
        .textFieldStyle(DefaultTextFieldStyle())
        .background(Color.yellow)
        .cornerRadius(6)
        .padding()
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(title: "321",iconName: "house", state: .constant("asd"))
    }
}

