//
//  FrontViewController.swift
//  SSY
//
//  Created by Navi on 28/03/2019.
//  Copyright © 2019 Navi. All rights reserved.
//

import UIKit
import Lumina

class FrontViewController: UIViewController{

    

    @IBOutlet weak var btn_shoot: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setup_ui()
    }
    func setup_ui(){
        self.btn_shoot.layer.cornerRadius = 4
    }
    @IBAction func btn_backPressed(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    @IBAction func btn_startShooting(_ sender: UIButton) {
//        let camera = LuminaViewController()
//        present(camera, animated: true, completion:nil)

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
