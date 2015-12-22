//
//  ViewController.swift
//  AccediendoHTTPS
//
//  Created by Wilman Garcia De Leon on 12/19/15.
//  Copyright © 2015 vengapps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var searchtext: UITextField!


    
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {   //delegate method
        let valorAbuscar = searchtext.text
        
        if (valorAbuscar == ""){
            print("Ingrese codigo")
                    return false
        }else{
        print(valorAbuscar)
        return true
        }

    }
    
    


    

func sincrono(){
        let Urls = "https://dia.ccm.itesm.mx/"
        let url = NSURL( string: Urls)
        let datos:NSData? = NSData(contentsOfURL: url!)
        let texto = NSString (data:datos!, encoding: NSUTF8StringEncoding)
        print(texto)
    
    }
    
    func asincrono(){
    
        let Urls = "http://capp.chapinzone.com"
        let url = NSURL( string: Urls)
        let sesion = NSURLSession.sharedSession()
        let bloque = {(datos: NSData?, resp:NSURLResponse?,error:NSError?) -> Void in
            let texto = NSString (data:datos!, encoding: NSUTF8StringEncoding)
            print(texto)
        }
        
        let dt = sesion.dataTaskWithURL(url!, completionHandler: bloque)
            dt.resume()
            print("antes o despues2")
        
        
    
        
    
    
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        UIKeyboardTypeWebSearch
//        searchtext.keyboardType = UIKeyboardTypeWebSearch


//        asincrono()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

