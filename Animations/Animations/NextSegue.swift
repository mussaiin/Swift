//
//  NextSegue.swift
//  Animations
//
//  Created by Nurlybek Mussin on 02.04.18.
//  Copyright © 2018 Nurlybek Mussin. All rights reserved.
//

import UIKit

class NextSegue: UIStoryboardSegue {
    override func perform() {
        scale()
    }
    func scale() {
        let toViewController = self.destination
        let fromViewController = self.source
        
        let containerView = fromViewController.view.superview
        let originalCenter = fromViewController.view.center
        
        toViewController.view.transform = CGAffineTransform(scaleX: 1, y: 1)
//        toViewController.view.transform = CGAffineTransform(scaleX: 0.05, y: 0.05)
        toViewController.view.center = originalCenter
        toViewController.view.alpha = 0
        toViewController.view.center.y -= toViewController.view.frame.height
//        toViewController.view.center.y += toViewController.view.frame.height
        containerView?.addSubview(toViewController.view)
        
        UIView.animate(withDuration: 1, delay: 0, options: .transitionFlipFromTop, animations: {
            toViewController.view.alpha = 1
            toViewController.view.transform = CGAffineTransform.identity
//            fromViewController.view.center.y -= fromViewController.view.frame.height
//            toViewController.view.center.y -= toViewController.view.frame.height
            fromViewController.view.center.y += fromViewController.view.frame.height
            toViewController.view.center.y += toViewController.view.frame.height
        }, completion: { success in
            fromViewController.present(toViewController, animated: false, completion: nil)
        })
        
    }
}
