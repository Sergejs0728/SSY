//
//  CameraViewController.swift
//  SSY
//
//  Created by Navi on 28/03/2019.
//  Copyright © 2019 Navi. All rights reserved.
//

import UIKit

class CameraViewController: UIViewController {

    @IBOutlet weak var btn_selfie: UIButton!
    @IBOutlet weak var btn_snapshot: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setup_ui()
        // Do any additional setup after loading the view.
    }
    func setup_ui(){
        self.btn_selfie.layer.cornerRadius = self.btn_selfie.frame.width/2
        self.btn_snapshot.layer.cornerRadius = self.btn_snapshot.frame.width/2
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func btn_backPressed(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)

    }
    @IBAction func btn_selfie(_ sender: UIButton) {

    }
    @IBAction func btn_snapshot(_ sender: UIButton) {
        
    }
    
    
}
