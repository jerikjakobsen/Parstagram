//
//  LoginViewController.swift
//  Parstagram
//
//  Created by John Jakobsen on 10/23/20.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func onSignIn(_ sender: Any) {
        let username = usernameTextField.text!
        let password = passwordTextField.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user, error) in
            if (user != nil) {
                self.usernameTextField.text = ""
                self.passwordTextField.text = ""
                self.performSegue(withIdentifier: "loginSegue", sender: self)
            } else {
                print("Error: \(error?.localizedDescription)")
            }
            
        }
        
    }
    @IBAction func onSignUp(_ sender: Any) {
        let user = PFUser()
        user.username = usernameTextField.text
        user.password = passwordTextField.text
        user.signUpInBackground { (success, err) in
            if success {
                self.usernameTextField.text = ""
                self.passwordTextField.text = ""
                self.performSegue(withIdentifier: "loginSegue", sender: self)
            } else {
                print("Error Occured: \(err?.localizedDescription)")
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
