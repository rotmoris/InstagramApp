//
//  CameraViewController.swift
//  InstagramApp
//
//  Created by Peter Orisadipe on 24/05/2019.
//  Copyright © 2019 Gwinyai Nyatsoka. All rights reserved.
//

import UIKit

class CameraViewController: UIViewController {

    @IBOutlet weak var simpleCameraView: SimpleCameraView!
    
    var simpleCamera: SimpleCamera!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        simpleCamera = SimpleCamera(cameraView: simpleCameraView)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        simpleCamera.startSession()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        
        simpleCamera.stopSession()
        
    }
    
    
    @IBAction func startCapture(_ sender: Any) {
        
        if simpleCamera.currentCaptureMode == .photo {
            
            simpleCamera.takePhoto { (image, success) in
                
                if success {
                    
                    print ("image success")
                    
                }
                
            }
            
        }
    
    }
    

}
