//
//  SignUpViewController.swift
//  SSY
//
//  Created by Navi on 28/03/2019.
//  Copyright © 2019 Navi. All rights reserved.
//

import UIKit
import NKVPhonePicker
import MobileBuySDK

class SignUpViewController: UIViewController {

    @IBOutlet weak var tf_email: CustomTextField!
    @IBOutlet weak var tf_confirm_password: CustomTextField!
    @IBOutlet weak var tf_password: CustomTextField!
    @IBOutlet weak var tf_phone_number: NKVPhonePickerTextField!
    @IBOutlet weak var btn_signup: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setup_ui()
    }
    
    @IBAction func btn_signupPressed(_ sender: UIButton) {
        /*
        let phonenumber = self.tf_phone_number.phoneNumber
        let email = tf_email.text
        let password = tf_password.text
        
        var tmp = [[String: Any]]()
        tmp = [["a" : "ab"]]
        
        let addressData = [ [
            //                "name":"test5",
            "address1":email!,
            "city":phonenumber!,
            "province":phonenumber!,
            "phone":phonenumber!,
            "zip":phonenumber!,
            "first_name":"asdf",
            "last_name":"asdf", 
            "country":"russia",
            
//            "password":password!
            ] ] as [[String : Any]]
        
        let customerData = [
            "first_name":"Steve",
            "last_name":"Lastnameson"
//            "email":email!,
//            "phone":phonenumber!,
//            "verified_email":false,
//            "addresses":addressData,
//            "password": "newpass",
//            "password_confirmation": "newpass",
//            "send_email_welcome": false
            ] as [String : Any]
        
        let apiData = [
            
            "customer":customerData
            
        ] as [String : Any]
        // Mark - Indicator
        let alert = SweetAlert().showAlert("Loading...", subTitle: "", style: AlertStyle.success)
        APIManager.sharedInstance.SignUp(params: apiData ) { (response, success) in
            
            print(response)
            
            alert.closeAlert(0)
            
            
            if(success){
                
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { // change 2 to desired number of seconds
                        // Your code with delay
                        
                        alert.closeAlert(0)
//                        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
//
//                        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ConfirmViewController") as! ConfirmViewController
//                        nextViewController.userId = userId
//                        self.present(nextViewController, animated:true)
//
                    }

            }
            else{
                let alert = SweetAlert().showAlert("Ooops!", subTitle: "Please check your internet connection and try again!", style: AlertStyle.error)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { // change 2 to desired number of seconds
                    // Your code with delay
                    
                    alert.closeAlert(0)
                }
            }
        }
        
        */
        let shopDomain = "sewsewyou.myshopify.com"
        let apiKey     = "fee7dd263afe4ce343fd80b280d71bea"
        let client = Graph.Client(
            shopDomain: shopDomain,
            apiKey:     apiKey
        )
        client.cachePolicy = .cacheFirst(expireIn: 3600)
        let input = Storefront.CustomerCreateInput.create(email: tf_email.text!, password: tf_password.text!, firstName: .value("Sergey"), lastName: .value("N"), phone: .value("+79510197416"), acceptsMarketing: .value(true)
        )
        
        
        
        let mutation = Storefront.buildMutation { $0
            .customerCreate(input: input) { $0
                .customer { $0
                    .id()
                    .email()
//                    .password()
                    .firstName()
                    .lastName()
                }
                .userErrors { $0
                    .field()
                    .message()
                }
            }
        }
        
        let task     = client.mutateGraphWith(mutation) { (mutation, error) in
//            error.debugPrint()
            
            if let _ = mutation?.customerCreate?.customer?.firstName {
                
            } else {
                
            }
        }
                
        task.resume()
    }
    @IBAction func btn_backPressed(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    func setup_ui(){

        self.btn_signup.layer.cornerRadius = 4
        self.btn_signup.layer.borderWidth = 1
        self.btn_signup.layer.borderColor = UIColor(red: 36/255, green: 166/255, blue: 173/255, alpha: 1).cgColor
        
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
