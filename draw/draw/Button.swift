//
//  Button.swift
//  draw
//
//  Created by CSPrasad on 23/07/20.
//  Copyright © 2020 Medinin Health Tech Private Limited. All rights reserved.
//

import Foundation
import UIKit

class Button : UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 10
        
        clipsToBounds = true
    }
}
