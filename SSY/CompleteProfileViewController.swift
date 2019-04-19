//
//  CompleteProfileViewController.swift
//  SSY
//
//  Created by Navi on 27/03/2019.
//  Copyright © 2019 Navi. All rights reserved.
//

import UIKit

class CompleteProfileViewController: UIViewController {

    @IBOutlet weak var btn_save: UIButton!
    @IBOutlet weak var btn_cancel: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.setup_ui()
    }
    func setup_ui(){
        
        self.btn_save.layer.cornerRadius = 4
        self.btn_save.layer.borderWidth = 1
        self.btn_save.layer.borderColor = UIColor(red: 36/255, green: 166/255, blue: 173/255, alpha: 1).cgColor
        
        self.btn_cancel.layer.cornerRadius = 4
        self.btn_cancel.layer.borderWidth = 1
        self.btn_cancel.layer.borderColor = UIColor(red: 36/255, green: 166/255, blue: 173/255, alpha: 1).cgColor
        
    }
    @IBAction func btn_backPressed(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
        
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
