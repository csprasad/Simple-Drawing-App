//
//  GestureDrawView.swift
//  draw
//
//  Created by CSPrasad on 23/07/20.
//  Copyright © 2020 Medinin Health Tech Private Limited. All rights reserved.
//

import Foundation
import UIKit


public class GestureDrawView : BaseDrawView {
    
    private lazy var gesture : UIPanGestureRecognizer! = {
        let gesture = UIPanGestureRecognizer.init(target: self, action: #selector(handleGesture(_:)))
        gesture.maximumNumberOfTouches = 1
        gesture.minimumNumberOfTouches = 1
        gesture.requiresExclusiveTouchType = true
        self.addGestureRecognizer(gesture)
        return gesture
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        _ = self.gesture //Initialize gesture
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        _ = self.gesture //Initialize gesture
    }
    
    @objc private func handleGesture(_ gesture: UIPanGestureRecognizer) {

        let newPoint = gesture.location(in: self)
        
        switch gesture.state {
        case .began:
            return
        case .changed:
            path.append(newPoint)
            refresh()
            return
            
        case .ended:
            paths.append(path)
            refresh()
            return
            
        case .cancelled,.failed:
            fallthrough
        default:
            path.removeAll()
            refresh()
            return
        }
    }
}
