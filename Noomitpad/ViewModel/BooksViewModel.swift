//
//  BooksViewModel.swift
//  Noomitpad
//
//  Created by Fahreddin Gölcük on 15.05.2021.
//
import SwiftUI
import Firebase
import FirebaseFirestoreSwift

class BooksViewModel: ObservableObject {
    @Published var books = [Book]()
    private let db = Firestore.firestore()
    private let deviceId = UIDevice.current.identifierForVendor?.uuidString
    init() {
        db.collection("books").document(deviceId!).collection("books")
            .addSnapshotListener { documentSnapshot, error in
                guard let documents = documentSnapshot?.documents else {
                print("Error fetching document: \(error!)")
                return
              }
                self.books = documents.map{(query) -> Book in
                    let data = query.data()
                    let name = data["name"] as? String ?? ""
                    let author = data["author"] as? String ?? ""
                    let page = data["page"] as? Int ?? 0
                    let subject = data["subject"] as? String ?? ""
                    let startTime = data["startTime"] as? Date ?? Date()
                    let endTime = data["endTime"] as? Date ?? Date()
                    let starRate = data["starRate"] as? Int ?? 0
                    return Book(id:query.documentID, name: name, author: author, page: page, subject: subject, startTime: startTime, endTime: endTime, starRate: starRate)
                }
            }
    }
    
    func addBook(book: Book){
        do{
            let _ = try db.collection("books").document(deviceId!).collection("books").addDocument(from: book)
        }catch{
            print(error)
        }
    }
    
    func uploadBookPhoto(image: UIImage){
        let storage = Storage.storage().reference(withPath: deviceId!)
        do{
            storage.putData(image.jpegData(compressionQuality: 1.0)!)
        }
    }
    
    func deleteBook(bookId: String) {
        db.collection("books").document(deviceId!).collection("books").document(bookId).delete()
    }
    
    func updateBook(bookId: String,book: Book) {
        do {
            let _ = try db.collection("books").document(deviceId!).collection("books").document(bookId).setData(from: book)
        }catch {
            print(error)
        }
    }
}
