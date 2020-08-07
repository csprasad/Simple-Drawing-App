//
//  ViewController.swift
//  draw
//
//  Created by CSPrasad on 23/07/20.
//  Copyright © 2020 Medinin Health Tech Private Limited. All rights reserved.
//

import UIKit
import drawing


class ViewController: UIViewController {
    
     @IBOutlet weak var drawView: BaseDrawView!
    @IBOutlet weak var txtView: UITextView!
    
    @IBOutlet weak var btnTxt: UIButton!
    @IBOutlet weak var btnDraw: UIButton!
    @IBOutlet weak var btnErase: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtView.isHidden = true
    }

    @IBAction func clearall(_ sender: Any) {
        drawView.undo()
    }
    
    @IBAction func text(_ sender: Any) {
        btnTxt.setImage(#imageLiteral(resourceName: "Disabled"), for: .normal)
        btnDraw.setImage(#imageLiteral(resourceName: "pen_unselected"), for: .normal)
        btnErase.setImage(#imageLiteral(resourceName: "eraser_unselected"), for: .normal)
        drawView.startOver()
        txtView.becomeFirstResponder()
        txtView.isHidden = false
        
    }
    
    @IBAction func draw(_ sender: Any) {
        btnTxt.setImage( #imageLiteral(resourceName: "Disabled-1"), for: .normal)
        btnDraw.setImage(#imageLiteral(resourceName: "pen_selected"), for: .normal)
        btnErase.setImage(#imageLiteral(resourceName: "eraser_unselected"), for: .normal)
        txtView.isHidden = true
        drawView.strokeColor = .black
        drawView.fillColor = .black
        UIView.transition(with: drawView, duration: 1, options: .curveEaseInOut, animations: {
            self.drawView.startOver()
        }) { (Bool) in
            
        }
    }
    
    @IBAction func rubber(_ sender: Any) {
        btnTxt.setImage(#imageLiteral(resourceName: "Disabled-1"), for: .normal)
        btnDraw.setImage(#imageLiteral(resourceName: "pen_unselected"), for: .normal)
        btnErase.setImage(#imageLiteral(resourceName: "eraser_selected"), for: .normal)
        drawView.undo()
    }
    
    @IBAction func save(_ sender: Any) {
        let image = drawView.exportImage()
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ImgController") as? ImgController {
            print("moving next")
            vc.ig = image
            print(image?.size as Any)
            self.present(vc, animated: true)
        }
    }
    
}

