//
//  ControllerFinal.swift
//  Make a Pizza
//
//  Created by Wilman Garcia De Leon on 1/21/16.
//  Copyright © 2016 vengapps. All rights reserved.
//

import UIKit

class ControllerFinal: UIViewController {
     var ingredientesFinales : [String] = []
     var tamanoPizza : String = ""
     var TipoMasa : String = ""
     var TipoQueso : String = ""

    @IBOutlet weak var pIngredientes: UITextView!
    @IBOutlet weak var pTipoQueso: UILabel!
    @IBOutlet weak var pTipoMasa: UILabel!
    @IBOutlet weak var ptamanopizza: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.ptamanopizza.text = tamanoPizza
        self.pTipoMasa.text = TipoMasa
        self.pTipoQueso.text = TipoQueso
        
        for item in ingredientesFinales{
            
            pIngredientes.text = pIngredientes.text +  item + ", "
            
        }


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
        
        
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    @IBAction func btnAceptar(sender: UIButton) {
     
        
    
        AlertaIngredientes()
        
        self.ptamanopizza.text = ""
        self.pTipoMasa.text = ""
        self.pTipoQueso.text = ""
        self.pIngredientes.text = ""
        

     
        
    }
    
   
    
    
    @IBAction func btnSalir(sender: AnyObject) {
        navigationController?.popToRootViewControllerAnimated(true)
        
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        // Get the new view controller using segue.destinationViewController.
//        // Pass the selected object to the new view controller.
//        
////        let irInicio = segue.destinationViewController as! ControllerFinal
//        
////        AlertaIngredientes()
//        
//        
//    }
//    
    
    func AlertaIngredientes() {
        
            let alerta = UIAlertController(title: "Make a Pizza", message: " Gracias por usar esta APP para pedir tu Pizza" , preferredStyle: .Alert)
            
            let actionOK = UIAlertAction(title: "OK", style: .Default , handler:
                
                {action in
                    
                    // aqui se pone una accion que se requiera
                    
                    
                    
                }
                
            )
            
            alerta.addAction(actionOK)
            
            self.presentViewController(alerta , animated: true, completion: nil)
            
        
    }

    

}
