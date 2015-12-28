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
    
    
    @IBOutlet weak var titulolibro: UILabel!
    @IBOutlet weak var imageview: UIImageView!
//    @IBOutlet weak var Resultado: UITextView!
    
    @IBOutlet weak var autor: UILabel!
    
    var dico3 : NSArray = []
    var autoresarr : String!
    var strurlImg : String?
    var urlImg: NSURL!
    
    
    
    @IBOutlet weak var autores: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
                autores.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnLimpiar(sender: AnyObject) {
        
        autores.text = ""
        titulolibro.text = "Titulo del libro"
        autor.text = "Autores"
        ISBN.focused
    }
    
    
   
    func getDataFromUrl(url:NSURL, completion: ((data: NSData?, response: NSURLResponse?, error: NSError? ) -> Void)) {
        NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) in
            completion(data: data, response: response, error: error)
            }.resume()
    }
    
    func downloadImage(url: NSURL){
        print("Download Started")
        print("lastPathComponent: " + (url.lastPathComponent ?? ""))
        getDataFromUrl(url) { (data, response, error)  in
            dispatch_async(dispatch_get_main_queue()) { () -> Void in
                guard let data = data where error == nil else { return }
                print(response?.suggestedFilename ?? "")
                print("Download Finished")
                self.imageview.image = UIImage(data: data)
            }
        }
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
           let datos = NSData(contentsOfURL: url!)
            
            
//                    print (datos)
            do{
                let json = try NSJSONSerialization.JSONObjectWithData(datos!, options: NSJSONReadingOptions.MutableLeaves)
                let dico1 = json as! NSDictionary
                let dico2 = dico1["ISBN:\(escapedAddress)"] as! NSDictionary
                self.titulolibro.text = dico2["title"] as! NSString as String
//                print(dico2["title"] as! NSString as String)
                
//                print(dico2)
//
                self.dico3 = dico2["authors"] as! NSArray
               
              
                //valida portada
                if !((dico2["cover"]) == nil) {
                            let dico4 = dico2["cover"] as! NSDictionary
                                    self.strurlImg = dico4["medium"] as! NSString as String
                }
                
            } catch _ {
                
            }

            
            
            
            
            dispatch_async(dispatch_get_main_queue()) {  // agrega el contenido de modo asincrono
               
                
                //valida si trae url de portada
                if !(self.strurlImg == nil){
                        let url = NSURL(string: self.strurlImg!)
                        let data = NSData(contentsOfURL: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check
                        self.imageview.image = UIImage(data: data!)
                }
                
                for  id  in self.dico3 {
                    self.autoresarr = String(id["name"])
                    self.autores.text! =   self.autores.text!  + " \(self.autoresarr) "
                }
                
                let alertcontroller = UIAlertController(title: "Peticion HTTP", message: "Consulta Exitosa", preferredStyle: .Alert)
                let defaultaction = UIAlertAction(title: "OK", style: .Default, handler: nil)
                
                alertcontroller.addAction(defaultaction)
                self.presentViewController(alertcontroller, animated: true, completion: nil)
            }

            
           
            
            
            if (error != nil){
                    print(error)
                
                
                let alertcontroller_ = UIAlertController(title: "Error Peticion HTTP verifique su conexion a internet", message: String(error), preferredStyle: .Alert)
                let defaultaction_ = UIAlertAction(title: "OK", style: .Default, handler: nil)
                
                alertcontroller_.addAction(defaultaction_)
                self.presentViewController(alertcontroller_, animated: true, completion: nil)
                
                
                }
            
        }
        
        let dt = sesion.dataTaskWithURL(url!, completionHandler: bloque)
        dt.resume()
        
        
        
        
        
    }

    
}

