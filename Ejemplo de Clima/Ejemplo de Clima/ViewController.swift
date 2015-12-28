//
//  ViewController.swift
//  Ejemplo de Clima
//
//  Created by Wilman Garcia De Leon on 12/25/15.
//  Copyright © 2015 vengapps. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIPickerViewAccessibilityDelegate , UIPickerViewDataSource{

    @IBOutlet weak var city: UILabel!
    
    var Ciudades : Array<Array<String>> = Array<Array<String>>()
    
    @IBOutlet weak var temp: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Ciudades.append(["CARACAS", "VEXX008"])
        Ciudades.append(["PARIS", "FRXX0076"])
                Ciudades.append(["GUATEMALA CITY", "GTXX0002"])
                Ciudades.append(["ANTIGUA GUATEMALA", "GTXX0020"])
                Ciudades.append(["TECPAN GUATEMALA", "GTXX0947"])
                Ciudades.append(["QUETZALTENANGO", "GTXX0005"])
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        
        return 1
        
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return self.Ciudades.count
        
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.Ciudades[row][0]
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let Urls = "https://query.yahooapis.com/v1/public/yql?format=json&q=SELECT%20*%20FROM%20weather.forecast%20WHERE%20u%20=%20%27c%27%20and%20location%20=%20%27"
        let url = NSURL(string: Urls + self.Ciudades[row][1] + "%27")
        let datos = NSData(contentsOfURL: url!)
//        print (datos)
        do{
                let json = try NSJSONSerialization.JSONObjectWithData(datos!, options: NSJSONReadingOptions.MutableLeaves)
                let dico1 = json as! NSDictionary
                let dico2 = dico1["query"] as! NSDictionary
                let dico3 = dico2["results"] as! NSDictionary
                let dico4 = dico3["channel"] as! NSDictionary
                let dico5 = dico4["location"] as! NSDictionary
                self.city.text = dico5["city"] as! NSString as String
                let dico6 = dico4["item"] as! NSDictionary
                let dico7 = dico6["condition"] as! NSDictionary
                self.temp.text = dico7["temp"] as! NSString as String
 //            print (dico2)
            
        } catch _ {
        
        }
    }
    
}

