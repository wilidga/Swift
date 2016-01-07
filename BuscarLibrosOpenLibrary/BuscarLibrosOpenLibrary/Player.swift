//
//  Player.swift
//  BuscarLibrosOpenLibrary
//
//  Created by Wilman Garcia De Leon on 1/4/16.
//  Copyright © 2016 vengapps. All rights reserved.
//


import UIKit

struct Player {
    var titulo: String?
    var isbn: String?
//    var rating: Int
    
    init(titulo: String?, isbn: String?/*, rating: Int*/) {
        self.titulo = titulo
        self.isbn = isbn
//        self.rating = rating
    }
}


var playersData = [
    Player(titulo:"", isbn:"")
//    Player(name: "Oscar Peterson", game: "Spin the Bottle", rating: 5),
//    Player(name: "Dave Brubeck", game: "Texas Hold 'em Poker", rating: 2)
]

