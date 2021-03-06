//
//  SimpleDrawView.swift
//  draw
//
//  Created by CSPrasad on 23/07/20.
//  Copyright © 2020 Medinin Health Tech Private Limited. All rights reserved.
//

import Foundation
import UIKit


public class SimpleDrawView : BaseDrawView {
    
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    internal override func commonInit() {
        self.isMultipleTouchEnabled = false
        self.isExclusiveTouch = true
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        debugInfo("touchesBegan")
    }
    
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        debugInfo("touchesMoved")
        guard let touch = touches.first else { return }
        let newPoint = touch.preciseLocation(in: self)
        path.append(newPoint)
        refresh()
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        debugInfo("touchesEnded")
        paths.append(path)
        path.removeAll()
        refresh()
    }
    
    public override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        debugInfo("touchesCancelled")
        path.removeAll()
        refresh()
    }
}
