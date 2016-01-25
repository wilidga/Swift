//
//  VistaResultados.swift
//  CalculadoraIMC
//
//  Created by Wilman Garcia De Leon on 1/10/16.
//  Copyright © 2016 vengapps. All rights reserved.
//

import UIKit

class VistaResultados: UIViewController {

    @IBOutlet weak var Resultado: UILabel!
    var indiceIM: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(animated: Bool) {
        self.Resultado.text = String( indiceIM )
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
