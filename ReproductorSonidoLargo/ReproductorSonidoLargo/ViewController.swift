//
//  ViewController.swift
//  ReproductorSonidoLargo
//
//  Created by Wilman Garcia De Leon on 12/26/15.
//  Copyright © 2015 vengapps. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    private var reproductor : AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let urlaudio = NSBundle.mainBundle().URLForResource("04 Fear of the Dark", withExtension: "mp3")
        do{
            try reproductor = AVAudioPlayer(contentsOfURL: urlaudio!)
        
        } catch{
            print("Error al cargar el archivo de sonido")
        }
    }
    
    @IBAction func stop() {
        if reproductor.playing{
            reproductor.stop()
            reproductor.currentTime = 0
            print("Stop")
        }
    }
    
    @IBAction func play() {
        if !reproductor.playing{
            reproductor.play()
                        print("Play")
        }
    }
    
    @IBAction func pausa() {
        if reproductor.playing{
            reproductor.pause()
                print("pausa")
        }
    }
}

