//
//  ViewController.swift
//  Reproductor
//
//  Created by Wilman Garcia De Leon on 12/28/15.
//  Copyright © 2015 vengapps. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController  , UIPickerViewAccessibilityDelegate , UIPickerViewDataSource {

    var Canciones  : Array<Array<String>> = Array<Array<String>>()

    private var reproductor : AVAudioPlayer!

    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var Titulo: UILabel!
    
    @IBOutlet weak var mySwitch: UISwitch!
    
    
    @IBOutlet weak var portadaImageView: UIImageView!
    
//    var pinballVoiceArray = ["Basso", "Blow", "Bottle","Frog","Funk","Glass","Hero","morning_alarm"]
//    var randomIndex = 0
    
    
    // arreglo de canciones ramdon con un mismo tipo de formato
    var songsArray = ["Basso", "Blow", "Bottle","Frog","Funk","Glass","Hero","Morse","Ping"]
    
    // funcion que escoge cual tocar
    func playRandomsongs() {
        let random = Int(arc4random_uniform(UInt32(songsArray.count)))
        
        let soundFile = songsArray[random]
        let path =  soundFile
        let fullPath = NSBundle.mainBundle().pathForResource(path, ofType: "aiff")!
        let fileLocation = NSString(string:fullPath)
        
        
        self.Titulo.text = soundFile
//        self.portadaImageView.image = UIImage(named:self.Canciones[random][2])
        
        let urlaudio = NSURL(string: fileLocation as String)
      
        do {
           
            
                try reproductor = AVAudioPlayer(contentsOfURL: urlaudio!)
                    reproductor.prepareToPlay()
                    reproductor.play()
        } catch{
            print("Error al cargar el archivo de sonido")
        }
        
        
    }
    
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

            //lista de canciones del  Uipickerview
        Canciones.append(["Basso","aiff","1.jpg"])
                Canciones.append(["Blow","aiff","2.jpg"])
                Canciones.append(["Bottle","aiff","3.jpg"])
                Canciones.append(["Frog","aiff","4.jpg"])
                Canciones.append(["Funk","aiff","5.jpg"])
                Canciones.append(["Glass","aiff","6.jpg"])
                Canciones.append(["Hero","aiff","7.jpg"])
                Canciones.append(["Morse","aiff","9.jpg"])
                Canciones.append(["Ping","aiff","10.jpg"])
                Canciones.append(["morning_alarm","mp3","8.jpg"])
    }

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        
        return 1
        
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return self.Canciones.count
        
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.Canciones[row][0]
    }

    //func para tocar la seleccionada de la lista
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.Titulo.text = self.Canciones[row][0]
        self.portadaImageView.image = UIImage(named:self.Canciones[row][2])

        
        let urlaudio = NSBundle.mainBundle().URLForResource(self.Canciones[row][0], withExtension: self.Canciones[row][1])
        do{
            try reproductor = AVAudioPlayer(contentsOfURL: urlaudio!)
            
        } catch{
            print("Error al cargar el archivo de sonido")
        }
        
        if !reproductor.playing{
            reproductor.play()
             print("Play")
        }

    }

    
    

    @IBAction func buttonClicked(sender: AnyObject) {
        
        self.portadaImageView.image = UIImage(named:"1.jpg")

        
        // este inicia el random
        if mySwitch.on{
           
           
            
            for index in 0...9 {
                
                                           playRandomsongs() // funcion que ejecuta camcion por cancion al azar
                sleep(3)

                print(index)

                
            }
            mySwitch.setOn(false, animated: true)
        }
        
    }
    
    @IBAction func sliderValueChanged(sender: UISlider) {
      //sube el volume al reproductor
        let valorvol = Int(sender.value)
        
        dispatch_async(dispatch_get_main_queue()) {  // agrega el contenido de modo asincrono
            
            
        self.reproductor.volume = Float ( valorvol)
        }
    }

    
   //botones de control de canciones.
    @IBAction func tocar() {
        if !reproductor.playing{
            reproductor.play()
            print("Play")
        }
    }
    
    
    @IBAction func pausar() {
        if reproductor.playing{
            reproductor.pause()
            print("pausar")
        }
    }
    
    @IBAction func detener() {
        if reproductor.playing{
            reproductor.stop()
            reproductor.currentTime = 0
            print("detener")
        }
        
    }
    
}

