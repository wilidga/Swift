//
//  ViewController.swift
//  IMC Calculator
//
//  Created by Wilman Garcia De Leon on 12/16/15.
//  Copyright © 2015 vengapps. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var peso: UITextField!
    @IBOutlet weak var estatura: UITextField!
    
    
    @IBOutlet weak var scroll: UIScrollView!
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        peso.delegate = self
        estatura.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func textFieldDidBeginEditing(textField: UITextField) {
        var punto : CGPoint
        
        punto = CGPointMake(0, textField.frame.origin.y - 50)
        self.scroll.setContentOffset(punto, animated: true)
        
    }
    
    @IBAction func textFieldDidEndEditing(textField: UITextField) {
        self.scroll.setContentOffset(CGPointZero, animated: true)
    }
    
    @IBAction func backgroundTap(sender:UIControl){
       
        peso.resignFirstResponder()
        estatura.resignFirstResponder()
    
    }
    
    @IBAction func textFielDoneEditing(sender:UITextField){

        sender.resignFirstResponder()// Desaparecer el teclado
        
    
    }
    
    @IBAction func calcularIMC(sender: AnyObject) {
        
        var IMC : Double
        let PesoLocal : Double?
        PesoLocal = Double (self.peso.text!)!
        let EstaturaLocal :Double = Double(self.estatura.text!)!
        IMC = PesoLocal!/(EstaturaLocal * EstaturaLocal)
        print ("El resutado es  \(IMC)")
        
        
    }

}

