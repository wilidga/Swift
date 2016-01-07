//
//  DetailControlerRow.swift
//  BuscarLibrosOpenLibrary
//
//  Created by Wilman Garcia De Leon on 1/7/16.
//  Copyright © 2016 vengapps. All rights reserved.
//

import UIKit

class DetailControlerRow: UIViewController {
    
//    var players:[Player] = playersData
    var toPassISBN :String!
    
    @IBOutlet weak var portada: UIImageView!
    @IBOutlet weak var autores: UITextView!
    @IBOutlet weak var titulo: UITextField!
    @IBOutlet weak var textISBN: UITextField!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.title = "Detalle de los libros"
        self.autores.text = nil
        self.textISBN.text = toPassISBN
        self.buscar(self.textISBN.text!)
        
    }
    
    //    override func segueForUnwindingToViewController(toViewController: UIViewController, fromViewController: UIViewController, identifier: String?) -> UIStoryboardSegue? {
    //        <#code#>
    //    }
    
    
    @IBAction func BuscarISBN(sender: UITextField) {
        
        let texto = sender.text
        if(texto != nil && texto?.isEmpty == false) {
            buscar(texto!)
        }
        
    }
    
    func buscar(isbn:String) {
        if (isbn.isEmpty == false) {
            textISBN.resignFirstResponder()
            
            let urls = "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:\(isbn)"
            let url = NSURL(string: urls)
            
            let datos:NSData? = NSData(contentsOfURL: url!)
            if (datos != nil) {
                do {
                    let texto = NSString(data: datos!, encoding: NSUTF8StringEncoding)
                    if (texto != nil) {
                        //                        self.resultado.text = texto as! String
                        print("consta true")
                    }
                    let json = try NSJSONSerialization.JSONObjectWithData(datos!, options: NSJSONReadingOptions.MutableLeaves)
                    let objDiccionario1 = json as! NSDictionary
                    
                    if(objDiccionario1["ISBN:\(isbn)"] != nil) {
                        let objDiccionario2 = objDiccionario1["ISBN:\(isbn)"] as! NSDictionary
                        self.titulo.text = objDiccionario2["title"] as! NSString as String
//                        let strtitulo = objDiccionario2["title"] as! NSString as String
                        
                        
                        
//                        if playersData.count == 1 {
//                            let player = players[0] as Player
//                            if player.titulo == ""{
//                                playersData.removeAll()
//                                playersData.append(Player(titulo: strtitulo, isbn:"\(isbn)"))
//                            } else {
//                                playersData.append(Player(titulo: strtitulo, isbn:"\(isbn)" )  )
//                            }
//                        }else{
//                            playersData.append(Player(titulo: strtitulo, isbn:"\(isbn)" )  )
//                        }
                        let arregloDiccionariosAutor = objDiccionario2["authors"] as! Array<NSDictionary>
                        var autor = ""
                        var i : Int = 0
                        
                        for diccionarioAutor in arregloDiccionariosAutor {
                            if( i != 0) {
                                autor += ", "
                            }
                            autor += diccionarioAutor["name"] as! NSString as String
                            
                            i++
                        }
                        self.autores.text = autor
                        
                        if(objDiccionario2["cover"] != nil) {
                            let objDiccionario3 = objDiccionario2["cover"] as! NSDictionary
                            
                            let cover = objDiccionario3["large"] as! NSString as String
                            
                            if(cover != "") {
                                if let checkedUrl = NSURL(string: cover) {
                                    portada.contentMode = .ScaleAspectFit
                                    downloadImage(checkedUrl)
                                }
                            }
                        }
                    }
                    
                }
                catch _ {
                    
                }
            } else {
                showSimpleAlert()
            }
        }
    }
    
    func getDataFromUrl(url:NSURL, completion: ((data: NSData?, response: NSURLResponse?, error: NSError? ) -> Void)) {
        NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) in
            completion(data: data, response: response, error: error)
            }.resume()
    }
    
    
    /// Show an alert with an "Okay" button.
    func showSimpleAlert() {
        let title = NSLocalizedString("Error de Internet", comment: "")
        let message = NSLocalizedString("No se puede establecer conexión a internet.", comment: "")
        let cancelButtonTitle = NSLocalizedString("OK", comment: "")
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        
        // Create the action.
        let cancelAction = UIAlertAction(title: cancelButtonTitle, style: .Cancel) { action in
            NSLog("No se puede establecer conexión a internet.")
        }
        
        // Add the action.
        alertController.addAction(cancelAction)
        
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    func downloadImage(url: NSURL){
        getDataFromUrl(url) { (data, response, error)  in
            dispatch_async(dispatch_get_main_queue()) { () -> Void in
                guard let data = data where error == nil else { return }
                self.portada.image = UIImage(data: data)
            }
        }
    }
    
    
}
