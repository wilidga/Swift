//
//  ViewController.swift
//  ejemploMapa
//
//  Created by Wilman Garcia De Leon on 1/17/16.
//  Copyright © 2016 vengapps. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapa: MKMapView!
    private var manejador = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manejador.delegate = self
        manejador.desiredAccuracy = kCLLocationAccuracyBest
        manejador.requestAlwaysAuthorization()
        
        var punto = CLLocationCoordinate2D()
        punto.longitude = 19.52748
        punto.latitude = -96.92315
        let pin = MKPointAnnotation()
        pin.title = "Jalapa"
        pin.subtitle = "Veracruz"
        pin.coordinate = punto
                mapa.addAnnotation(pin)


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

 
}

