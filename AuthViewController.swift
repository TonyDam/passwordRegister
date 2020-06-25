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
    
    // 1. Créer une nouvelle collection avec le signup()
    // 2. Créer une 3ème vue pour créer un nouveau Credential
    // 3. Sauvegarder le Credential
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
        FireAuth().auth.addStateDidChangeListener { (auth, user) in
            if user != nil {
                self.performSegue(withIdentifier: "segueToMain", sender: nil)
                self.emailTF.text = ""
                self.passwordTF.text = ""
                self.nicknameTF.text = ""
                self.segmentedControl.selectedSegmentIndex = 0
                //self.passwordTF.isSecureTextEntry = self.passwordTF.isSecureTextEntry ? false : true
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Masquer le clavier
        view.endEditing(true)
    }
    
    
    @IBAction func validateBtnDidPressed(_ sender: Any) {
        // Inscrire l'user
        // Verifier que l'email n'est pas une chaine de caractère vide
        guard let email = emailTF.text, email != "" else {
            presentAlert(title: "Attention !", message: "Vous n'avez pas renseigné d'e-mail")
            return
        }
        guard let password = passwordTF.text, password != "" else {
            presentAlert(title: "Attention !", message: "Vous n'avez pas renseigné de mot de passe")
            return
        }
        if segmentedControl.selectedSegmentIndex == 0 {
            // Connexion
            FireAuth().signIn(email: email, password: password) {
                (error, uid) in
                if let error = error {
                    self.presentAlert(title: "ERREUR", message: error)
                }
                if let uid = uid {
                    // Nous pourrons nous servir de cet uid dans l'application
                }
            }
        } else {
            guard let nickname = nicknameTF.text, nickname != "" else {
                presentAlert(title: "Attention !", message: "Vous n'avez pas renseigné de pseudo")
                return
            }
            // Inscription
            FireAuth().signUp(email: email, password: password, nickname: nickname) { (error, uid) in
                if let error = error {
                    self.presentAlert(title: "Erreur", message: error)
                }
                if let uid = uid {
                    // Créer la collection de credentials du user dans la DB
                    
                }
            }
        }

    }
    
    // Au clic sur Connexion ou Inscription, change le wording du bouton vert en conséquence
    @IBAction func segmentedChanged(_ sender: Any) {
        setupUI()
       
    }
    
    
    // Fonction qui change l'UI selon si l'user est co ou pas
    private func setupUI() {
        
        let isConnexionSegment = segmentedControl.selectedSegmentIndex == 0
        let title = isConnexionSegment ? "Se connecter" : "S'inscrire"
        validateBtn.setTitle(title, for: .normal)
        nicknameTF.isHidden = isConnexionSegment
    }
    private func presentAlert(title: String, message: String) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "J'ai compris", style: .default, handler: nil))
        present(alertVC, animated: true, completion: nil )
    }
}

