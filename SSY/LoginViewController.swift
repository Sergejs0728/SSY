//
//  LoginViewController.swift
//  SSY
//
//  Created by Navi on 03/04/2019.
//  Copyright © 2019 Navi. All rights reserved.
//

import UIKit
import MobileBuySDK

class LoginViewController: UIViewController {

    @IBOutlet weak var tf_password: CustomTextField!
    @IBOutlet weak var tf_email: CustomTextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func bnt_loginPressed(_ sender: UIButton) {
        
        if loginValidation(email: tf_email.text!, password: tf_password.text!){
            self.APiCallForLogin()
        }

//        Client.shared.login(email: tf_email.text!, password: tf_password.text!) { accessToken in
//
//            if let accessToken = accessToken {
////                AccountController.shared.save(accessToken: accessToken)
////                self.showOrders(animated: true)
//            } else {
//                let alert = UIAlertController(title: "Login Error", message: "Failed to login a customer with this email and password. Please check your credentials and try again.", preferredStyle: .alert)
//                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
//                self.present(alert, animated: true, completion: nil)
//            }
//        }
        
    }
    

    
    func APiCallForLogin()  {
        
        let client = Graph.Client(
            shopDomain: "graphql.myshopify.com",
            apiKey:     "8e2fef6daed4b93cf4e731f580799dd1"
        )
        
        
        let input = Storefront.CustomerAccessTokenCreateInput.create(
            email:    self.tf_email.text!,
            password: self.tf_password.text!
        )
        
        let mutation = Storefront.buildMutation { $0
            .customerAccessTokenCreate(input: input) { $0
                .customerAccessToken { $0
                    .accessToken()
                    .expiresAt()
                }
                .userErrors { $0
                    .field()
                    .message()
                }
            }
        }
        
        
        let task = client.mutateGraphWith(mutation) { response, error in
            
            if let response = response?.customerAccessTokenCreate {
                print("sucess: \(response)")
                
//                print("Token: \(response.customerAccessToken?.accessToken)")
                if response.customerAccessToken?.accessToken != nil {

                    self.getUserInfo(strToken: (response.customerAccessToken?.accessToken)!)
                    
                }else{
                    let alert = UIAlertController(title: "Login Error", message: "\(response.customerUserErrors.description)", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
                
            } else {
                
                let alert = UIAlertController(title: "Login Error", message: "Failed to login a customer with this email and password. Please check your credentials and try again.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alert, animated: true, completion: nil)

            }
            
        }
        
        task.resume()
        
        
    }
    
    func getUserInfo(strToken :String)  {
        
        
        let client = Graph.Client(
            shopDomain: "graphql.myshopify.com",
            apiKey:     "8e2fef6daed4b93cf4e731f580799dd1"
        )

        
        let query = Storefront.buildQuery { $0
            .customer(customerAccessToken: strToken) { $0
                .id()
                .firstName()
                .lastName()
                .email()
            }
        }
        
        
        
        let task = client.queryGraphWith(query) { response, error in
           
            if let response = response {
                print("sucess: \(response)")

                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let newViewController = storyBoard.instantiateViewController(withIdentifier: "CompleteProfileViewController") as!  CompleteProfileViewController
                self.present(newViewController, animated: true, completion: nil)


            } else {
                let alert = UIAlertController(title: "Login Error", message: "Failed to login a customer with this email and password. Please check your credentials and try again.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
        task.resume()
        
    }

    
    
    @IBAction func btn_backPressed(_ sender: UIButton) {

        self.navigationController?.popViewController(animated: true)
   
    }

    // Validation methods
    
    func loginValidation(email:String, password:String)->Bool{
        
        if email.count > 0 {
            if isValidEmail(testStr: email){
                if password.count > 0{
                    return true
                }else{
                    showAlertMessage(message: "Please enter password")
                    return false
                }
            }else{
                showAlertMessage(message: "Please enter valid email")
                return false
            }
        }else{
            showAlertMessage(message:  "Please enter email.")
            return false
        }
    }
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    func showAlertMessage(message: String)  {
        
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)

    }
}
