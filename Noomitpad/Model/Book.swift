//
//  Book.swift
//  Noomitpad
//
//  Created by Fahreddin Gölcük on 15.05.2021.
//

import SwiftUI

struct Book: Encodable, Identifiable, Hashable {
    var id: String = UUID().uuidString
    var name: String
    var author: String
    var page: Int
    var subject: String
    var startTime: Date
    var endTime: Date
    var starRate: Int
}
