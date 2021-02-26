//
//  Created by soul on 2021/02/14.
//

import Firebase
import FirebaseFirestoreSwift

final class LocalCollection<T: Codable> {

  private(set) var items: [T]
  private(set) var documents: [DocumentSnapshot] = []
  let query: Query

  private let updateHandler: ([DocumentChange]) -> ()

  private var listener: ListenerRegistration? {
    didSet {
      oldValue?.remove()
    }
  }

  var count: Int {
    return self.items.count
  }

  subscript(index: Int) -> T {
    return self.items[index]
  }

  init(query: Query, updateHandler: @escaping ([DocumentChange]) -> ()) {
    print("zxc - LocalCollection - init")
    
    self.items = []
    self.query = query
    self.updateHandler = updateHandler
  }

  func index(of document: DocumentSnapshot) -> Int? {
    for i in 0 ..< documents.count {
      if documents[i].documentID == document.documentID {
        return i
      }
    }

    return nil
  }

  func listen() {
    print("zxc - LocalCollection - listen")
    
    guard listener == nil else { return }
    listener = query.addSnapshotListener { [unowned self] querySnapshot, error in
      guard let snapshot = querySnapshot else {
        print("Error fetching snapshot results: \(error!)")
        return
      }
      let models = snapshot.documents.map { (document) -> T in
        let maybeModel: T?
        do {
          maybeModel = try document.data(as: T.self);
        } catch {
          fatalError("Unable to initialize type \(T.self) from data \(document.data()): \(error)")
        }

        if let model = maybeModel {
          return model
        } else {
          fatalError("Missing document of type \(T.self) at \(document.reference.path)")
        }
      }
      self.items = models
      self.documents = snapshot.documents
      self.updateHandler(snapshot.documentChanges)
    }
  }

  func stopListening() {
    listener = nil
  }

  deinit {
    stopListening()
  }
}
