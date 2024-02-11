//
//  ViewController.swift
//  Touches
//
//  Created by Radu Florin Gocan on 29.01.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var greenView: UIView!
    var offset: CGPoint?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        let touch = touches.first!
        if touch.view == greenView {
            let location = touch.location(in: greenView)
            offset = location
            return
        }
        offset = nil
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        let touch = touches.first!
        let location = touch.location(in: view)
        
        guard let offset = offset else {
            return
        }
        
        if touch.view == greenView {
            greenView.frame.origin.x = location.x - offset.x
            greenView.frame.origin.y = location.y - offset.y
        }
        print("touches moved \(location)")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        let touch = touches.first!
        let location = touch.location(in: view)
        print("touches ended \(location)")
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        print("touches cancelled")
    }

}

