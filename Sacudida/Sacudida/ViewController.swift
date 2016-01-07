//
//  ViewController.swift
//  Sacudida
//
//  Created by Wilman Garcia De Leon on 1/2/16.
//  Copyright © 2016 vengapps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var sacudida: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

//
//    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
//        if motion == .MotionShake{
//            sacudida.text = "Si"
//        }
//    }

    @IBAction func Limpiar() {
        self.sacudida.text = nil
    }
}

