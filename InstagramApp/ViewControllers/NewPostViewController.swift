//
//  NewPostViewController.swift
//  InstagramApp
//
//  Created by Peter Orisadipe on 31/03/2019.
//  Copyright © 2019 Gwinyai Nyatsoka. All rights reserved.
//

import UIKit

enum NewPostPagesToShow: Int {
    
    case library, camera
    
    var identifier: String {
        
        switch self {
            
        case .library:
            
            return "PhotoLibraryVC"
            
        case .camera:
            
            return "CameraVC"
            
        }
        
    }
    
    static func pagesToShow() -> [NewPostPagesToShow] {
        
        return [.library, .camera]
        
    }
}

class NewPostViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelButtonPressed))
        
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
    }
    

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @objc func cancelButtonPressed() {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func libraryButtonDidTouch(_ sender: Any) {
        
        NotificationCenter.default.post(name: NSNotification.Name("newPost"), object: NewPostPagesToShow.library)
        
    }
    
    @IBAction func cameraButtonDidTouch(_ sender: Any) {
        
        NotificationCenter.default.post(name: NSNotification.Name("newPost"), object: NewPostPagesToShow.camera)
        
    }
}


