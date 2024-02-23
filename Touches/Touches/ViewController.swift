//
//  ViewController.swift
//  Touches
//
//  Created by Radu Florin Gocan on 29.01.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var greenView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panned))
        greenView.addGestureRecognizer(panGesture)
        panGesture.delegate = self
    }
    
    @objc func panned(_ gesture: UIPanGestureRecognizer) {
        
        let translation = gesture.translation(in: greenView)
        
        greenView.frame.origin.x += translation.x
        greenView.frame.origin.y += translation.y
        
        gesture.setTranslation(.zero, in: greenView)
    }
    
    @IBAction func longPressed(_ sender: UILongPressGestureRecognizer) {
        if sender.state == .began {
            greenView.transform = CGAffineTransform(scaleX: 1.25, y: 1.25)
        }
        if sender.state == .ended {
            greenView.transform = .identity
        }
    }
    
}

extension ViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}

