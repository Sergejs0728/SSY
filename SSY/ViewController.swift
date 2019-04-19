//
//  ViewController.swift
//  SSY
//
//  Created by Navi on 27/03/2019.
//  Copyright © 2019 Navi. All rights reserved.
//

import UIKit

import CoreLocation

class ViewController: UIViewController ,CLLocationManagerDelegate{

    var locationManager: CLLocationManager?
    
    @IBOutlet weak var btn_login: UIButton!
    @IBOutlet weak var btn_signup: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setup_ui()
        
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestAlwaysAuthorization()
        
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            print("New location is \(location)")
            locationManager?.stopUpdatingLocation()
            
        }
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways {
            // you're good to go!
            locationManager?.startUpdatingLocation()
        }
    }
    func setup_ui(){
        
        self.btn_login.layer.cornerRadius = 4
        self.btn_login.layer.borderWidth = 1
        self.btn_login.layer.borderColor = UIColor(red: 36/255, green: 166/255, blue: 173/255, alpha: 1).cgColor
        
        self.btn_signup.layer.cornerRadius = 4
        self.btn_signup.layer.borderWidth = 1
        self.btn_signup.layer.borderColor = UIColor(red: 36/255, green: 166/255, blue: 173/255, alpha: 1).cgColor
        
    }
}
extension UIButton{
    override open var isHighlighted: Bool {
        didSet {
            if(tag == -1){
                backgroundColor = isHighlighted ? UIColor(red: 36/255, green: 166/255, blue: 173/255, alpha: 1) : UIColor.white
                
                titleLabel?.textColor = !isHighlighted ? UIColor(red: 36/255, green: 166/255, blue: 173/255, alpha: 1) : UIColor.white
            }
            
        }
    }
}

