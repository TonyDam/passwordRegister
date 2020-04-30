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
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var nicknameTF: UITextField!
    @IBOutlet weak var validateBtn: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupUI()
    }
    
    @IBAction func validateBtnDidPressed(_ sender: Any) {
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

