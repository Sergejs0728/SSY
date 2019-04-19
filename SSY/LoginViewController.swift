//
//  LoginViewController.swift
//  SSY
//
//  Created by Navi on 03/04/2019.
//  Copyright © 2019 Navi. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var tf_password: CustomTextField!
    @IBOutlet weak var tf_email: CustomTextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func bnt_loginPressed(_ sender: UIButton) {
        
        Client.shared.login(email: tf_email.text!, password: tf_password.text!) { accessToken in
            if let accessToken = accessToken {
//                AccountController.shared.save(accessToken: accessToken)
//                self.showOrders(animated: true)
            } else {
                let alert = UIAlertController(title: "Login Error", message: "Failed to login a customer with this email and password. Please check your credentials and try again.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alert, animated: true, completion: nil)
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
