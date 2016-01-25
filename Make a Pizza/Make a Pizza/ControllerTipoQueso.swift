//
//  ControllerTipoQueso.swift
//  Make a Pizza
//
//  Created by Wilman Garcia De Leon on 1/19/16.
//  Copyright © 2016 vengapps. All rights reserved.
//

import UIKit

class ControllerTipoQueso: UIViewController, UIPickerViewDelegate{

    var TipoQueso =  ["Mozarela", "Cheddar", "Parmesano", "Sin queso"]
    var iselect : Int = -1
    var tamanoPizza : String = ""
    var TipoMasa : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return TipoQueso.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        iselect = row
        return TipoQueso[row]
        
    }
    

    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let Ingredientes = segue.destinationViewController as! ControllerIngredientes
        Ingredientes.TipoMasa = TipoMasa
        Ingredientes.TipoQueso = TipoQueso[iselect]
        Ingredientes.tamanoPizza = tamanoPizza
        
    }
    

}
