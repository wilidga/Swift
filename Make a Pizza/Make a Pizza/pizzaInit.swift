//
//  pizzaInit.swift
//  Make a Pizza
//
//  Created by Wilman Garcia De Leon on 1/18/16.
//  Copyright © 2016 vengapps. All rights reserved.
//

import UIKit

class pizzaInit: UIViewController,UIPickerViewDelegate {
    
    var tamanoPizza = ["Grande","Mediana","Pequena"]
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
        return tamanoPizza.count
    }

    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        iselect = row
        return tamanoPizza[row]

    }

    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
            let TipoMasa = segue.destinationViewController  as! ControllerTipoMasa
            TipoMasa.tamanoPizza = tamanoPizza[iselect]
        
    }


}
