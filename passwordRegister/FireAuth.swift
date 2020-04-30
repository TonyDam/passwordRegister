//
//  FireAuth.swift
//  passwordRegister
//
//  Created by TonyDam on 30/04/2020.
//  Copyright © 2020 TonyDam. All rights reserved.


import Foundation
import Firebase

// Pour savoir si un user est enregistré ou pas + création de compte
class FireAuth {
    
    // Cette fonction permet de savoir si un user est enregistrer ou pas
    func isAuth() -> Bool {
        return Auth.auth().currentUser?.uid != nil
    }
    
    
    // Fonction pour se logué
    func signIn() {
        
    }
    
    
    //Fonction pour s'enregistrer
    func signUp() {
        
    }
    
    
    // Fonction pour se déconnecter
    func signOut() {
        
    }
}
