import Foundation
import Firebase

class FireDB {
    let store = Firestore.firestore()
    var users: CollectionReference {
        return store.collection("users")
    }
    func addUser(_ uid: String, data: [String: Any]) {
        users.document(uid).setData(data)
    }
    func addCredentials(_ uid: String) {
        
    }
}
