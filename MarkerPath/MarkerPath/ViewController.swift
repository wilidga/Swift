//
//  ViewController.swift
//  MarkerPath
//
//  Created by Wilman Garcia De Leon on 1/24/16.
//  Copyright © 2016 vengapps. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController ,CLLocationManagerDelegate{

    @IBOutlet weak var mapa: MKMapView!
      private var manejador = CLLocationManager()
    var latitude: Double = 0.0
    var longitude: Double = 0.0
    var titulo : String = ""
    var SubTitulo: String = ""
    var startLocation:CLLocation!
    var moveMetersnew : Double = 0
    var moveMeterslast : Double = 0

    var lastLocation: CLLocation!
    var traveledDistance:Double = 0
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        manejador.delegate = self
        manejador.desiredAccuracy = kCLLocationAccuracyBest
        manejador.requestAlwaysAuthorization()
        startLocation = nil
        
        var punto = CLLocationCoordinate2D()
        punto.longitude = 19.52748
        punto.latitude = -96.92315
        let pin = MKPointAnnotation()
        pin.title = "Jalapa"
        pin.subtitle = "Veracruz"
        pin.coordinate = punto
        mapa.addAnnotation(pin)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    

    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == .AuthorizedAlways{
            manejador.startUpdatingLocation()
            mapa.showsUserLocation = true
        }else{
            manejador.stopUpdatingLocation()
            mapa.showsUserLocation = false
            
            
        }

    }
    
    // obteniendo coordenadas
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let latestLocation: AnyObject = locations[locations.count - 1]


        
        
            latitude = manager.location!.coordinate.latitude
            longitude = manager.location!.coordinate.longitude
            titulo = "latitude : \(latitude)" + " longitude: \(longitude)"
            SubTitulo = ""
       
        
        if startLocation == nil {
            startLocation = latestLocation as! CLLocation
        }
        
        let distanceBetween: CLLocationDistance =
        latestLocation.distanceFromLocation(startLocation)
        
//        nueva distancia
        moveMetersnew += Double(distanceBetween)
        
       
        
        if (moveMetersnew - moveMeterslast > 50){
            addPoint(latitude, longitude: longitude, titulo: titulo, Subtitulo:String(distanceBetween))
            

            print(moveMetersnew )
            print(moveMeterslast )  
            
            //        ultima distancia
            moveMeterslast += moveMetersnew
            print(moveMeterslast )
        
        }
        
        
        
//        print(distanceBetween)
   
        
        
        
        
 
        
        
    }
    
    func addPoint(latidue: Double, longitude : Double, titulo : String, Subtitulo: String){
   
        
       
        
        
        var punto = CLLocationCoordinate2D()
        punto.longitude = longitude
        punto.latitude = latidue
        let pin = MKPointAnnotation()
        pin.title = titulo
        pin.subtitle = "Distancia:  " + Subtitulo
        pin.coordinate = punto
        mapa.addAnnotation(pin)
        
    
    }
    
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        let alerta = UIAlertController(title: "Error", message: "error \(error.code)" , preferredStyle: .Alert)
        let actionOK = UIAlertAction(title: "OK", style: .Default , handler:
            {action in
                // aqui se pone una accion que se requiera
                
            }
        )
        alerta.addAction(actionOK)
        self.presentViewController(alerta , animated: true, completion: nil)
        
        
    }
    
    
 


}

