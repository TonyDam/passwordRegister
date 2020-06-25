import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var logoutBtn: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func logoutBtnDidPressed(_ sender: Any) {
        if let error = FireAuth().signOut() {
        let alertVC = UIAlertController(title: "Erreur !", message: error, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "J’ai compris", style: .default, handler: nil))
        present(alertVC, animated: true, completion: nil)
        return
        }
        navigationController?.popViewController(animated: true)
    }

}
