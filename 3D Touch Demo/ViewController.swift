//
//  ViewController.swift
//  3D Touch Demo
//
//  Created by Bharat Bhushan on 19/10/16.
//  Copyright © 2016 IBM. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIViewControllerPreviewingDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if traitCollection.forceTouchCapability == UIForceTouchCapability.available {
            registerForPreviewing(with: self as UIViewControllerPreviewingDelegate, sourceView: view)
        } else {
            print("3D Touch not available")
        }
    }

    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        let peekVC = storyboard?.instantiateViewController(withIdentifier: "PeekViewController") as? PeekViewController
        return peekVC
        
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
         let popVC = storyboard?.instantiateViewController(withIdentifier: "PopViewController") as? PopViewController
        present(popVC!, animated: true, completion: nil)
    }


}

