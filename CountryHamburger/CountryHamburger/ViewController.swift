//
//  ViewController.swift
//  CountryHamburger
//
//  Created by Wilman Garcia De Leon on 12/14/15.
//  Copyright © 2015 vengapps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    
    @IBOutlet weak var pais: UILabel!

    @IBOutlet weak var Hamburguesa: UILabel!
    let colores = Colores()
    let getPais = ColeccionDePaises()
    let hamburguesa = ColeccionDeHamburguesa()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnQuieroHambur(sender: AnyObject) {
        
        
        let getColores = colores.RegresaColores()
        
        let ObtenerPais = getPais.obtenPais()
        
        let obtenerHamburguesa = hamburguesa.obtenHamburguesa()
        
        
        
        view.backgroundColor = getColores
        view.tintColor = getColores
        
        pais.text = ObtenerPais
        
        Hamburguesa.text = obtenerHamburguesa
    }

}

