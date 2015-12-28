//
//  ViewController.swift
//  EjemploSonidoUno
//
//  Created by Wilman Garcia De Leon on 12/26/15.
//  Copyright © 2015 vengapps. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {

    private var miSonido: SystemSoundID = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let sonidoUrl = NSBundle.mainBundle().URLForResource("Submarine", withExtension: "aiff") //paso 5
        AudioServicesCreateSystemSoundID(sonidoUrl! as CFURL, &miSonido)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func play(sender: UIButton) {
        AudioServicesPlaySystemSound(miSonido)
        
    }
}

