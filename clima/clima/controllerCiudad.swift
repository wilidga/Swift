//
//  controllerCiudad.swift
//  clima
//
//  Created by Wilman Garcia De Leon on 1/1/16.
//  Copyright © 2016 vengapps. All rights reserved.
//

import UIKit

class controllerCiudad: UIViewController {
    
    var codigo = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        let urls = "https://query.yahooapis.com/v1/public/yql?format=json&q=SELECT%20*%20FROM%20weather.forecast%20WHERE%20u%20=%20%27c%27%20and%20location%20=%20%27"
        let url  = NSURL (string: urls + codigo + "%27")
        
        let datos = NSData(contentsOfURL: url!)
        
        print(datos)

        do{
            let json = try NSJSONSerialization.JSONObjectWithData(datos!, options: NSJSONReadingOptions.MutableLeaves )
            let dico = json as!  NSDictionary
            let dico1 = dico["query"] as!  NSDictionary
            let dico2 = dico1["results"] as!  NSDictionary
            let dico3 = dico2["channel"] as!  NSDictionary
            let dico4 = dico3["item"] as!  NSDictionary
            let dico5 = dico4["condition"] as!  NSDictionary
            let temp = dico5["temp"] as! NSString
            print(temp)
           
        }catch _ {
            print("Error ")
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
