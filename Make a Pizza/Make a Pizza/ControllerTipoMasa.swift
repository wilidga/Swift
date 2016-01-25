//
//  ControllerTipoMasa.swift
//  Make a Pizza
//
//  Created by Wilman Garcia De Leon on 1/19/16.
//  Copyright © 2016 vengapps. All rights reserved.
//

import UIKit

class ControllerTipoMasa: UIViewController , UIPickerViewDelegate{
    var tamanoPizza : String = ""
    var TipoMasaPizza = ["Delgada", "Crujiente", "Gruesa"]
    var iselect : Int = -1

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
        return TipoMasaPizza.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        iselect = row
        return TipoMasaPizza[row]
        
    }
    

    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let VistaTipoQueso = segue.destinationViewController as! ControllerTipoQueso
        VistaTipoQueso.tamanoPizza = tamanoPizza
        VistaTipoQueso.TipoMasa = TipoMasaPizza[iselect]
        
    }
    

}
