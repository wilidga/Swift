//: Playground - noun: a place where people can play

import UIKit

enum Velocidades : Int {
    
    case  Apagado = 0,// representa la velocidad 0.
    
    VelocidadBaja = 20,// representa una velocidad de 20km por hora.
    
    VelocidadMedia = 50,// representa una velocidad de 50km por hora
    
    VelocidadAlta = 120//, representa una velocidad de 50km por hora.
    
    
    init (velocidadInicial : Velocidades  ) {
        self = velocidadInicial
    }
    
}

class Auto {
    
    var velocidad : Velocidades
    var estadoNumerico : Int
    
            init(){
                    self.velocidad = .Apagado
                    estadoNumerico = self.velocidad.rawValue
                }
    
    
    func cambioDeVelocidad() -> (actual : Int, velocidadEnCadena : String ){
        let strdesc : String
        estadoNumerico = self.velocidad.rawValue
        switch self.velocidad{
        case .Apagado:
            self.velocidad = .VelocidadBaja
            strdesc = "Apagado"
        case .VelocidadBaja:
            self.velocidad = .VelocidadMedia
            strdesc = "Velocidad Baja"
        case .VelocidadMedia:
            self.velocidad = .VelocidadAlta
            strdesc = "Velocidad Media"
        case .VelocidadAlta:
            self.velocidad = .VelocidadMedia
            strdesc = "Velocidad Alta"
        }
        return (actual: estadoNumerico, velocidadEnCadena: strdesc)
    }
}
var auto = Auto()
var ttupla : (actual : Int, velocidadEnCadena : String )
for var i in 1...20 {
    ttupla = auto.cambioDeVelocidad()
    print("\(ttupla.actual), \(ttupla.velocidadEnCadena)")
}
    
