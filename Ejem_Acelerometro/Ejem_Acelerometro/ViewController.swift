//
//  ViewController.swift
//  Ejem_Acelerometro
//
//  Created by Wilman Garcia De Leon on 1/2/16.
//  Copyright © 2016 vengapps. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    @IBOutlet weak var xetiqueta: UILabel!
    
    @IBOutlet weak var Yetiqueta: UILabel!
    
    @IBOutlet weak var Zetiqueta: UILabel!

    @IBOutlet weak var sacEtiqueta: UILabel!
    private let manejador = CMMotionManager()
    private let cola = NSOperationQueue()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if manejador.accelerometerAvailable{
            manejador.accelerometerUpdateInterval = 1.0/10.0
            manejador.startAccelerometerUpdatesToQueue(cola, withHandler: {
            
                    datos, error in
                if error != nil{
                    self.manejador.stopAccelerometerUpdates()
                }else{
                    dispatch_async(dispatch_get_main_queue(), {
                        
                            self.xetiqueta.text = "\(datos!.acceleration.x)"
                            self.Yetiqueta.text = "\(datos!.acceleration.y)"
                            self.Zetiqueta.text = "\(datos!.acceleration.z)"
                        
                        if(datos!.acceleration.x > 1.6 || datos?.acceleration.y > 1.6 || datos!.acceleration.z > 1.6){
                            self.sacEtiqueta.text = "Si"
                        }
                        
                    })
                }
            
            
            })
        
        
        
        
        } else{
        
            print("Accelerometro no disponible")
        }
        
        
        
        
    }

  
    @IBAction func Limpiar() {
        self.sacEtiqueta.text = ""
        
    }

}

