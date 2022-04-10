//
//  DatosFiguras.swift
//  Practica2
//
//  Created by Eduardo Gomez on 06/04/22.
//

import Foundation
import UIKit

let nomFiguras = ["Circulo","Triangulo","Cuadrado","Rectangulo","Rombo","Romboide","Trapecio","Pentagono"]

//factor alfa, crear una extension de UIColor  para crear un constructor que genera un color, sin un valor para el alfa (por defecto alfa es 1)

extension UIColor{
    convenience init(Red red :Double, Green green :Double, Blue blue :Double)
    {
        //UIColor(red: (CGFloat(red)/255), green: (CGFloat(green)/255), blue: (CGFloat(blue)/255), alpha: CGFloat((1)))
        self.init(red: (CGFloat(red)/255), green: (CGFloat(green)/255), blue: (CGFloat(blue)/255), alpha: CGFloat((1)))
    }
}
