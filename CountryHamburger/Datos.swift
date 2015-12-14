//
//  Datos.swift
//  CountryHamburger
//
//  Created by Wilman Garcia De Leon on 12/14/15.
//  Copyright © 2015 vengapps. All rights reserved.
//

import Foundation
import UIKit

struct Colores{
    
    let colores = [UIColor(red: 210/255.0 , green : 90/255.0, blue : 45/255.0, alpha:1 ),
        UIColor(red: 40/255.0  , green : 170/255.0, blue : 45/255.0, alpha:1 ),
        UIColor(red: 3/255.0   , green : 180/255.0, blue : 90/255.0, alpha:1 ),
        UIColor(red: 210/255.0 , green : 190/255.0, blue : 5/255.0, alpha:1 ),
        UIColor(red: 120/255.0 , green : 120/255.0, blue : 50/255.0, alpha:1 ),
        UIColor(red: 130/255.0 , green : 80/255.0, blue : 95/255.0, alpha:1 ),
        UIColor(red: 130/255.0 , green : 130/255.0, blue : 130/255.0, alpha:1 ),
        UIColor(red: 3/255.0   , green : 50/255.0, blue : 90/255.0, alpha:1 )]
    
    func RegresaColores()->UIColor {
        
        let randomNumber0To8 = Int(arc4random_uniform(8))
        return colores[randomNumber0To8
        ]
    }
    
}

class ColeccionDePaises{

    let países = ["Guatemala","El Salvador","Mexico","Nicaragua","Antártida",
                   "Afganistán","Bélgica","Belice","Ecuador","Egipto",
                  "El Salvador","Emiratos Árabes Unidos","Eritrea","Eslovaquia",        "Eslovenia",
                "España","Estados Unidos",        "Estonia",        "Etiopía",        "Filipinas",
                "Finlandia","Costa Rica",        "Croacia",        "Cuba",        "Dinamarca]"]
    
    func obtenPais()->String {
        
        let randomNumber0To8 = Int(arc4random_uniform(20))
        return países[randomNumber0To8]
        
    }

}

class ColeccionDeHamburguesa{
   
    let hamburguesas = ["QuesoBurguesa $ 4.00",
                        "Hamburguesa Doble  $ 4.00",
        "Hamburguesa Doble con queso  $ 3.00",
        "Hamburguesa Doble con tocino  $ 4.00",
        "Hamburguesa Triple  $ 5.00",
        "whopper $ 6.00",
        "whopper Doble $ 7.00",
        "Big Mac $ 8.00",
        "McNifica  $ 5.00",
        "Hamburguesa Argentina $ 4 00",
        "Hamburguesa Chilena $ 5.00",
        "Hamburguesa Mexicana $ 8.00",
        "Hamburguesa Guatemalteca $ 9.00",
        "Hamburguesa Salvadoreña $ 7.00",
        "Hamburguesa Nica $ 6.00",
        "Hamburguesa Pana $ 6.00",
        "Hamburguesa Costa $ 5.00",
        "Hamburguesa Brasilena $ 4.00",
        "Hamburguesa HN $ 4.00",
        "Hamburguesa GT $ 4.00"]
    
    func obtenHamburguesa()->String {
        
        let randomNumber0To8 = Int(arc4random_uniform(20))
        return hamburguesas[randomNumber0To8]
        
    }


}