//
//  ViewController.swift
//  Peticion al servidor
//
//  Created by Wilman Garcia De Leon on 12/21/15.
//  Copyright © 2015 vengapps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ISBN: UITextField!
    
    
    @IBOutlet weak var Resultado: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnLimpiar(sender: AnyObject) {
        
        Resultado.text = ""
        ISBN.text = ""
        ISBN.focused
    }


    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {   //delegate method

        
        
//        if (valorAbuscar == ""){
//            print("Ingrese codigo")
//            return false
//        }else{
//              /print(valorAbuscar)
            asincrono()
            return true
//        }
        
    }
    
    
    func asincrono(){
        
        var escapedAddress : String!
        

        escapedAddress = self.ISBN.text
        
        let Urls = "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:\(escapedAddress)"
        
        let url = NSURL( string: Urls)
        
        let sesion = NSURLSession.sharedSession()
        let bloque = {(datos: NSData?, resp:NSURLResponse?,error:NSError?) -> Void in
            let texto = NSString (data:datos!, encoding: NSUTF8StringEncoding)
            
           
            
            
            dispatch_async(dispatch_get_main_queue()) {  // agrega el contenido de modo asincrono
                self.Resultado.text = String(texto)
                
                let alertcontroller = UIAlertController(title: "Peticion HTTP", message: "Consulta Exitosa", preferredStyle: .Alert)
                let defaultaction = UIAlertAction(title: "OK", style: .Default, handler: nil)
                
                alertcontroller.addAction(defaultaction)
                self.presentViewController(alertcontroller, animated: true, completion: nil)
            }

            
           
            
            
            if (error != nil){
                    print(error)
                
                
                let alertcontroller_ = UIAlertController(title: "Error Peticion HTTP", message: String(error), preferredStyle: .Alert)
                let defaultaction_ = UIAlertAction(title: "OK", style: .Default, handler: nil)
                
                alertcontroller_.addAction(defaultaction_)
                self.presentViewController(alertcontroller_, animated: true, completion: nil)
                
                
                }
            
        }
        
        let dt = sesion.dataTaskWithURL(url!, completionHandler: bloque)
        dt.resume()
        
        
        
        
        
    }

    
}

