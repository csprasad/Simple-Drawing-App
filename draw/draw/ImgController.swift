//
//  ImgController.swift
//  draw
//
//  Created by CSPrasad on 23/07/20.
//  Copyright © 2020 Medinin Health Tech Private Limited. All rights reserved.
//

import UIKit

class ImgController: UIViewController {

    @IBOutlet weak var img: UIImageView!
    var ig: UIImage? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        img.image = ig
    }
}
