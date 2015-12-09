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
        let leyenda : String
        estadoNumerico = self.velocidad.rawValue
        switch self.velocidad{
        case .Apagado:
            self.velocidad = .VelocidadBaja
            leyenda = "Apagado"
        case .VelocidadBaja:
            self.velocidad = .VelocidadMedia
            leyenda = "Velocidad Baja"
        case .VelocidadMedia:
            self.velocidad = .VelocidadAlta
            leyenda = "Velocidad Media"
        case .VelocidadAlta:
            self.velocidad = .VelocidadMedia
            leyenda = "Velocidad Alta"
        }
        return (actual: estadoNumerico, velocidadEnCadena: leyenda)
    }
}
var auto = Auto()
var tupla : (actual : Int, velocidadEnCadena : String )
for var i in 1...20 {
    tupla = auto.cambioDeVelocidad()
    print("\(tupla.actual), \(tupla.velocidadEnCadena)")
}
    
