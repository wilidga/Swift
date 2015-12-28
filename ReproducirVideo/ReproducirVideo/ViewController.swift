//
//  ViewController.swift
//  ReproducirVideo
//
//  Created by Wilman Garcia De Leon on 12/27/15.
//  Copyright © 2015 vengapps. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
import MediaPlayer

class ViewController: UIViewController {


    private var reproductor :AVPlayer!
    private var controlador :AVPlayerViewController!
    
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let videoURL  = NSBundle.mainBundle().URLForResource("anim_card_flip", withExtension: "mp4")
        reproductor = AVPlayer(URL: videoURL!)
        controlador = AVPlayerViewController()
        controlador.player = reproductor
    }

  

    @IBAction func play() {
        self.addChildViewController(controlador)
        controlador.view.frame = CGRectMake(10, 20, 300, 250)
        self.view.addSubview(controlador.view)
        reproductor.play()
    }
}

