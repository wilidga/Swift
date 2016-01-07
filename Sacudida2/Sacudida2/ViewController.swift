//
//  ViewController.swift
//  Sacudida2
//
//  Created by Wilman Garcia De Leon on 1/2/16.
//  Copyright © 2016 vengapps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Sacudida: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if motion == .MotionShake {
            Sacudida.text = "Si"
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func clear() {
        self.Sacudida.text = ""
    }

}

