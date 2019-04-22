//
//  FrontViewController.swift
//  SSY
//
//  Created by Navi on 28/03/2019.
//  Copyright © 2019 Navi. All rights reserved.
//

import UIKit
import Lumina

class FrontViewController: UIViewController, TGCameraDelegate {

    
    @IBOutlet weak var photoView: UIImageView!

    @IBOutlet weak var btn_shoot: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setup_ui()
        self.setUpTGBViewcontroller()
    }
    func setup_ui(){
        self.btn_shoot.layer.cornerRadius = 4
    }
    
    func setUpTGBViewcontroller()  {
        // set custom tint color
        //TGCameraColor.setTint(.green)
        
        // save image to album
        TGCamera.setOption(kTGCameraOptionSaveImageToAlbum, value: true)
        
        // use the original image aspect instead of square
        //TGCamera.setOption(kTGCameraOptionUseOriginalAspect, value: true)
        
        // hide switch camera button
        //TGCamera.setOption(kTGCameraOptionHiddenToggleButton, value: true)
        
        // hide album button
        //TGCamera.setOption(kTGCameraOptionHiddenAlbumButton, value: true)
        
        // hide filter button
        //TGCamera.setOption(kTGCameraOptionHiddenFilterButton, value: true)
        
        photoView.clipsToBounds = true

    }
    @IBAction func btn_backPressed(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)

    }
    @IBAction func btn_startShooting(_ sender: UIButton) {
//        let camera = LuminaViewController()
//        present(camera, animated: true, completion:nil)
        let navigationController = TGCameraNavigationController.new(with: self)
        present(navigationController!, animated: true, completion: nil)

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    // MARK: TGCameraDelegate - Required methods
    
    func cameraDidCancel() {
        dismiss(animated: true, completion: nil)
    }
    
    func cameraDidTakePhoto(_ image: UIImage!) {
        photoView.image = image
        dismiss(animated: true, completion: nil)
    }
    
    func cameraDidSelectAlbumPhoto(_ image: UIImage!) {
        photoView.image = image
        dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: TGCameraDelegate - Optional methods
    
    func cameraWillTakePhoto() {
        print("cameraWillTakePhoto")
    }
    
    func cameraDidSavePhoto(atPath assetURL: URL!) {
        print("cameraDidSavePhotoAtPath: \(assetURL)")
    }
    
    func cameraDidSavePhotoWithError(_ error: Error!) {
        print("cameraDidSavePhotoWithError \(error)")
    }
    
    
    // MARK: Actions
    
    @IBAction func takePhotoTapped() {
        let navigationController = TGCameraNavigationController.new(with: self)
        present(navigationController!, animated: true, completion: nil)
    }
    
    
    // MARK: Private methods
    
    func clearTapped() {
        photoView.image = nil
    }
}
