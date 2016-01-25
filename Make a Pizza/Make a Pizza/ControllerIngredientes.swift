//
//  ControllerIngredientes.swift
//  Make a Pizza
//
//  Created by Wilman Garcia De Leon on 1/21/16.
//  Copyright © 2016 vengapps. All rights reserved.
//

import UIKit

class ControllerIngredientes: UIViewController {

    @IBOutlet weak var jamon: UISwitch!
    var ITotingredientes : Int = 0
    var ingredientes : [String] = []
    var tamanoPizza : String = ""
    var TipoMasa : String = ""
    var TipoQueso : String = ""
    var deleteIndex : Int = -1
    
    
    

    @IBOutlet weak var pina: UISwitch!
    @IBOutlet weak var anchoa: UISwitch!
    @IBOutlet weak var pimiento: UISwitch!
    @IBOutlet weak var cebolla: UISwitch!
    @IBOutlet weak var aceituna: UISwitch!
    @IBOutlet weak var pavo: UISwitch!
    @IBOutlet weak var pepperoni: UISwitch!
    @IBOutlet weak var pep: UILabel!
    @IBOutlet weak var salchicha: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnJamon(sender: AnyObject) {
        
        if jamon.on{
        
            if AlertaIngredientes(ITotingredientes){
                    ITotingredientes++
                print(ITotingredientes)

                ingredientes.append("Jamon")

            }else{
                jamon.setOn(false, animated: true)
            }
            
        
        
        } else {
           
                ITotingredientes--
                            print(ITotingredientes)
          deleteIndex =  deleteArray("Jamon")
            
            ingredientes.removeAtIndex(deleteIndex)
        }
    }
    
    
    
    @IBAction func btnPepperoni(sender: AnyObject) {
        if pepperoni.on{
            
            if AlertaIngredientes(ITotingredientes){
                ITotingredientes++
                print(ITotingredientes)
                                 ingredientes.append("Pepperoni")
            }else{
                pepperoni.setOn(false, animated: true)
            }
            
            
        } else {
            
            ITotingredientes--
            print(ITotingredientes)
            deleteIndex =  deleteArray("Pepperoni")
            
            ingredientes.removeAtIndex(deleteIndex)

        }

    }
    
    
    @IBAction func btnPavo(sender: AnyObject) {
        if pavo.on{
            
            if AlertaIngredientes(ITotingredientes){
                ITotingredientes++
                print(ITotingredientes)
                                                 ingredientes.append("Pavo")
            }else{
                pavo.setOn(false, animated: true)
            }
            
            
        } else {
            
            ITotingredientes--
            print(ITotingredientes)
            deleteIndex =  deleteArray("Pavo")
            
            ingredientes.removeAtIndex(deleteIndex)

        }

    }
    
    
    @IBAction func btnsalchicha(sender: AnyObject) {
        if salchicha.on{
            
            if AlertaIngredientes(ITotingredientes){
                ITotingredientes++
                print(ITotingredientes)
                                                 ingredientes.append("Salchicha")
            }else{
                salchicha.setOn(false, animated: true)
            }
            
            
        } else {
            
            ITotingredientes--
            print(ITotingredientes)
            deleteIndex =  deleteArray("Salchicha")
            
            ingredientes.removeAtIndex(deleteIndex)

        }

    }
    
    @IBAction func btnaceituna(sender: AnyObject) {
        if aceituna.on{
            
            if AlertaIngredientes(ITotingredientes){
                ITotingredientes++
                print(ITotingredientes)
                                                 ingredientes.append("Aceituna")
            }else{
                aceituna.setOn(false, animated: true)
            }
            
            
        } else {
            
            ITotingredientes--
            print(ITotingredientes)
            deleteIndex =  deleteArray("Aceituna")
            
            ingredientes.removeAtIndex(deleteIndex)

        }

    }
    
    @IBAction func btncebolla(sender: AnyObject) {
        if cebolla.on{
            
            if AlertaIngredientes(ITotingredientes){
                ITotingredientes++
                print(ITotingredientes)
                                                                 ingredientes.append("Cebolla")
            }else{
                cebolla.setOn(false, animated: true)
            }
            
            
        } else {
            
            ITotingredientes--
            print(ITotingredientes)
            deleteIndex =  deleteArray("Cebolla")
            
            ingredientes.removeAtIndex(deleteIndex)

        }

    }
    
    @IBAction func btnpimiento(sender: AnyObject) {
        if pimiento.on{
            
            if AlertaIngredientes(ITotingredientes){
                ITotingredientes++
                print(ITotingredientes)
                                                                                 ingredientes.append("Pimiento")
            }else{
                pimiento.setOn(false, animated: true)
            }
            
            
        } else {
            
            ITotingredientes--
            print(ITotingredientes)
            deleteIndex =  deleteArray("Pimiento")
            
            ingredientes.removeAtIndex(deleteIndex)

        }

    }
    
    
    @IBAction func btnpina(sender: AnyObject) {
        if pina.on{
            
            if AlertaIngredientes(ITotingredientes){
                ITotingredientes++
                print(ITotingredientes)
                                                                 ingredientes.append("Pina")
            }else{
                pina.setOn(false, animated: true)
            }
            
            
        } else {
            
            ITotingredientes--
            print(ITotingredientes)
            deleteIndex =  deleteArray("Pina")
            
            ingredientes.removeAtIndex(deleteIndex)

        }

    }
    
    
    
    @IBAction func btnanchoa(sender: AnyObject) {
        if anchoa.on{
            
            if AlertaIngredientes(ITotingredientes){
                ITotingredientes++
                print(ITotingredientes)
                                                                                ingredientes.append("Anchoa")
            }else{
                anchoa.setOn(false, animated: true)
            }
            
            
        } else {
            
            ITotingredientes--
            print(ITotingredientes)
            deleteIndex =  deleteArray("Anchoa")
            
            ingredientes.removeAtIndex(deleteIndex)

        }

    }
    
    
    
    func AlertaIngredientes(  ITotingredientes : Int) -> Bool{
        
        
        
        if ITotingredientes > 4 {
            
            let alerta = UIAlertController(title: "Solo se permite", message: " \(ITotingredientes) Ingredientes" , preferredStyle: .Alert)
            
            let actionOK = UIAlertAction(title: "OK", style: .Default , handler:
                
                {action in
                    
                    // aqui se pone una accion que se requiera
                    
                    
                    
                }
                
            )
            
            alerta.addAction(actionOK)
            
            self.presentViewController(alerta , animated: true, completion: nil)
            
            
            
            return false
            
        }
        
        return true
        
        
        
    }
    
    
    func deleteArray( Objeto : String ) ->Int{
    
       var indexx : Int = 0
        
        for item in ingredientes{
            
            if item == Objeto{
            
                indexx++
            }
        
        }
    
        return indexx
    
    }
    

    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let final = segue.destinationViewController as! ControllerFinal
        final.ingredientesFinales = ingredientes
        final.TipoMasa = TipoMasa
        final.TipoQueso = TipoQueso
        final.tamanoPizza = tamanoPizza
        print(ingredientes)
                print(TipoQueso)
                print(tamanoPizza)
    

    }
    

}
