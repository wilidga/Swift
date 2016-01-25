//
//  controllerRespuesta.swift
//  IMC Calculator
//
//  Created by Wilman Garcia De Leon on 1/10/16.
//  Copyright © 2016 vengapps. All rights reserved.
//

import UIKit

class controllerRespuesta: UIViewController {
    
    var respIMC : Double = 0.0

    @IBOutlet weak var respuestaIMC: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.respuestaIMC.text = String (respIMC)
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
