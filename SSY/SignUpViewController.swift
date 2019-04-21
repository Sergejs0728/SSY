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
        //        let shopDomain = "sewsewyou.myshopify.com"
        //        let apiKey     = "fee7dd263afe4ce343fd80b280d71bea"
        //        let client = Graph.Client(
        //            shopDomain: shopDomain,
        //            apiKey:     apiKey
        //        )
        //        client.cachePolicy = .cacheFirst(expireIn: 3600)
        //        let input = Storefront.CustomerCreateInput.create(email: tf_email.text!, password: tf_password.text!, firstName: .value("Sergey"), lastName: .value("N"), phone: .value("+79510197416"), acceptsMarketing: .value(true)
        //        )
        //
        //
        //
        //        let mutation = Storefront.buildMutation { $0
        //            .customerCreate(input: input) { $0
        //                .customer { $0
        //                    .id()
        //                    .email()
        ////                    .password()
        //                    .firstName()
        //                    .lastName()
        //                }
        //                .userErrors { $0
        //                    .field()
        //                    .message()
        //                }
        //            }
        //        }
        //
        //        let task     = client.mutateGraphWith(mutation) { (mutation, error) in
        ////            error.debugPrint()
        //
        //            if let _ = mutation?.customerCreate?.customer?.firstName {
        //
        //            } else {
        //
        //            }
        //        }
        //
        //        task.resume()
        
        if self.signupValidation(email: self.tf_email.text!, phoneNumber: self.tf_phone_number.text!, password: self.tf_password.text!, cofirmPassword: self.tf_confirm_password.text!) {
            self.APiallForRegistr()

        }
        
        
    }
    
    
    func APiallForRegistr()  {
        
        let client = Graph.Client(
            shopDomain: "graphql.myshopify.com",
            apiKey:     "8e2fef6daed4b93cf4e731f580799dd1"
        )
        
        let input = Storefront.CustomerCreateInput.create(
            email:            self.tf_email.text!,
            password:         self.tf_password.text!,
            firstName:        .value(self.tf_phone_number.text!),
            lastName:         .value(""),
            acceptsMarketing: .value(true)
        )
        
        let mutation = Storefront.buildMutation { $0
            .customerCreate(input: input) { $0
                .customer { $0
                    .id()
                    .email()
                    .firstName()
                    .lastName()
                }
                .userErrors { $0
                    .field()
                    .message()
                    
                }
            }
        }
        
        let task = client.mutateGraphWith(mutation) { response, error in
            
            if let response = response {
                
                
                print("Responce ", response)
                
                let alert = UIAlertController(title: "SYS", message: "register successfully.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
                    self.navigationController?.popViewController(animated: true)
                }))
                self.present(alert, animated: true, completion: nil)
                
                
            } else {
                let alert = UIAlertController(title: "SYS", message: "Something Worng.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
        task.resume()
        
        
    }
    
    
    @IBAction func btn_backPressed(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    func setup_ui(){
        
        self.btn_signup.layer.cornerRadius = 4
        self.btn_signup.layer.borderWidth = 1
        self.btn_signup.layer.borderColor = UIColor(red: 36/255, green: 166/255, blue: 173/255, alpha: 1).cgColor
        
    }
    
    
    func signupValidation(email:String, phoneNumber:String, password:String , cofirmPassword:String)->Bool{
        
        if email.count > 0{
            if isValidEmail(testStr: email){
                if phoneNumber.count > 9{
                    if password.count > 0{
                        if cofirmPassword.count > 0{
                      
                            if password == cofirmPassword {
                                
                                return true

                            }else{
                                showAlertMessage(message: "password and confirm password don't match")
                                
                                return false

                            }
                        }else{
                            showAlertMessage(message: "Password enter confirm pasword")

                            return false
                        }
                    }else{
                        showAlertMessage(message: "Password enter pasword")
                        return false
                    }
                }else{
                   showAlertMessage(message: "Please enter valid phone number.")
                    return false
                }
            }else{
                showAlertMessage(message:"Please enter email")
                return false
            }
        }else{
            showAlertMessage(message: "Please enter valid email")
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




