import UIKit

class CreateViewController: UIViewController {
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var urlTF: UITextField!
    @IBOutlet weak var nicknameTF: UITextField!
    @IBOutlet weak var titleTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func copyBtnDidPressed(_ sender: Any) {
        UIPasteboard.general.string = passwordTF.text
        // Informer l'utilisateur (flash/toast message)
    }
    @IBAction func shareBtnDidPressed(_ sender: Any) {
    }
    @IBAction func validateBtnDidPressed(_ sender: Any) {
        guard let title = titleTF.text, title != "" else {
            presentAlert(title: "Attention !", message: "Vous n'avez pas renseigné d'e-mail !" )
            return
        }
        guard let nickname = nicknameTF.text, nickname != "" else {
            presentAlert(title: "Attention !", message: "Vous n'avez pas renseigné de pseudo !" )
            return
        }
        guard let password = passwordTF.text, password != "" else {
            presentAlert(title: "Attention !", message: "Vous n'avez pas renseigné de mot de passe !" )
            return
        }
        guard let url = urlTF.text, url != "" else {
            presentAlert(title: "Attention !", message: "Vous n'avez pas renseigné d'URL !" )
            return
        }
    }
    
    private func presentAlert(title: String, message: String) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "J'ai compris", style: .default, handler: nil))
        present(alertVC, animated: true, completion: nil )
    }
    

}
