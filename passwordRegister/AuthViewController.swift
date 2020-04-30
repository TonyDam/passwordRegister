//
//  ViewController.swift
//  passwordRegister
//
//  Created by TonyDam on 23/04/2020.
//  Copyright © 2020 TonyDam. All rights reserved.
//

import UIKit

// C'est ici qu'on voit si un user est conecter ou pas, s'il est connecter il fera un segue vers le controller suivant
class AuthViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    // Fonction qui change l'UI selon si l'user est co ou pas
    func setupUI() {
        if FireAuth().isAuth() {
            // s'il est authentifié, on naviguera vers la 2eme page
            print("Utilisateur authentifiée")
        } else {
            // Sinon l'user doit s'authentifier
            print("Utilisateur non authentifié")
        }
    }

}

