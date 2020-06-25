import Foundation
import Firebase

// Pour savoir si un user est enregistré ou pas + création de compte
class FireAuth {
    let auth = Auth.auth()
    var currentId: String? {
        return auth.currentUser?.uid
    }

    // Fonction pour se logué
    func signIn(email: String, password: String, completion: @escaping (_ error: String?,_ uid: String?) -> Void) {
        // Se connecter
            auth.signIn(withEmail: email, password: password) { (data, error) in
            if let error = error {
                completion(error.localizedDescription, nil)
            }
            if let uid = data?.user.uid {
                completion(nil, uid)
            }
        }
    }
    
    
    //Fonction pour s'enregistrer
    func signUp(email: String, password: String, nickname: String, completion: @escaping (_ error: String?, _ uid: String?) -> Void) {
        auth.createUser(withEmail: email, password: password) { (data, error) in
            if let error = error {
                completion(error.localizedDescription, nil)
            }
            if let uid = data?.user.uid {
                completion(nil, uid)
            }
        }
    }
    
    
    // Fonction pour se déconnecter
    func signOut() -> String? {
    // Se déconnecter
        do {
            try auth.signOut()
            return nil
        } catch {
            return error.localizedDescription
        }
    }
}
