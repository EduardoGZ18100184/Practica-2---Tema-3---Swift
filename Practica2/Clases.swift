//
//  Clases.swift
//  Practica2
//
//  Created by Eduardo Gomez on 06/04/22.
//

import Foundation

protocol Figura
{
    func CalcularArea() -> Double

    
    func CalcularPerimetro() -> Double

    
    func CalcularVolumen() -> Double
}

class Circulo: Figura
{
     var dbl_radio :Double!
     var dbl_altura:Double!
     var dbl_perimetro :Double!
     var dbl_area :Double!
     var dbl_volumen :Double!
    
     required init(radioPerimetro Radio :Double) {
        self.dbl_radio = Radio
    }
    
    init(radioArea Radio :Double){
        self.dbl_radio = Radio
    }
    
    init(radioVolumen Radio :Double, alturaVolumen Altura :Double){
        self.dbl_radio = Radio
        self.dbl_altura = Altura
    }
    
    func CalcularArea() -> Double
    {
        dbl_area = pow(dbl_radio, 2) * Double.pi
        return dbl_area
    }
    
    func CalcularPerimetro() -> Double {
        dbl_perimetro = 2 * Double.pi * self.dbl_radio
        return dbl_perimetro
    }
    
    func CalcularVolumen() -> Double {
        dbl_volumen = Double.pi * (pow(dbl_radio, 2)) * self.dbl_altura
        return dbl_volumen
    }
}

class Triangulo: Figura
{
    //Propiedades para el area
    var dbl_altura_base :Double!
    var dbl_ancho :Double!
    //Perimetro
    var dbl_lado1:Double!
    var dbl_lado2:Double!
    //Volumen
    var dbl_altura_prisma :Double!
    //otros (axiliares)
    var dbl_perimetro :Double!
    var dbl_area :Double!
    var dbl_volumen :Double!
    
    init(_ Ancho :Double, _ AltoBase :Double){ //area
        self.dbl_ancho = Ancho
        self.dbl_altura_base = AltoBase
    }
    
    init(AnchoL3 L3 :Double, Lado2 L2 :Double, Lado1 L1 :Double){ //perimetro
        self.dbl_ancho = L3
        self.dbl_lado2 = L2
        self.dbl_lado1 = L1
    }
    
    init(_ Ancho :Double, _ AltoBase :Double, _ AltoPrisma :Double) { //volumen
        self.dbl_ancho = Ancho
        self.dbl_altura_base = AltoBase
        self.dbl_altura_prisma = AltoPrisma
    }
    
    func CalcularPerimetro() -> Double {
        dbl_perimetro = dbl_ancho + dbl_lado1 + dbl_lado2
        return dbl_perimetro
    }
    
    func CalcularArea() -> Double {
        dbl_area = (dbl_ancho * dbl_altura_base) / 2
        return dbl_area
    }
    
    func CalcularVolumen() -> Double {
        dbl_volumen = CalcularArea() * dbl_altura_prisma
        return dbl_volumen
    }
}

class Cuadrado: Figura
{
    //Propiedades para el area, perimetro y volumen
    public var dbl_altura_prisma :Double!
    public var dbl_lado :Double!
    //otras (auxiliares)
    public var dbl_perimetro :Double!
    public var dbl_area :Double!
    public var dbl_volumen :Double!
    
    init(_ Lado :Double, _ AltoPrisma :Double) { //volumen
        self.dbl_lado = Lado
        self.dbl_altura_prisma = AltoPrisma
    }
    
    init(LadoArea Lado :Double) { //area
        self.dbl_lado = Lado
    }
    
    init(LadoPerimetro Lado :Double) { //perimetro
        self.dbl_lado = Lado
    }
    
    func CalcularPerimetro() -> Double {
        dbl_perimetro = dbl_lado * 4
        return dbl_perimetro
    }
    
    func CalcularArea() -> Double {
        dbl_area = (dbl_lado * dbl_lado)
        return dbl_area
    }
    
    func CalcularVolumen() -> Double {
        dbl_volumen = CalcularArea() * dbl_altura_prisma
        return dbl_volumen
    }
}

class Rectangulo: Figura
{
    //propiedades para obtener area, volumen y perimetro
    public var dbl_altura_prisma :Double!
    public var dbl_lado_base :Double!
    public var dbl_lado_altura :Double!
    //otras
    public var dbl_perimetro :Double!
    public var dbl_area :Double!
    public var dbl_volumen :Double!
    
    init(_ LadoBase :Double, _ LadoAltura :Double, _ AltoPrisma :Double) { //volumen
        self.dbl_lado_base = LadoBase
        self.dbl_lado_altura = LadoAltura
        self.dbl_altura_prisma = AltoPrisma
    }
    
    init(LadoArea LadoBase :Double, LadoAlturaArea LadoAltura :Double) { //area
        self.dbl_lado_base = LadoBase
        self.dbl_lado_altura = LadoAltura
    }
    
    init(LadoPerim LadoBase :Double, LAlturaPerim LadoAltura :Double) { //perimetro
        self.dbl_lado_base = LadoBase
        self.dbl_lado_altura = LadoAltura
    }
    
    func CalcularPerimetro() -> Double {
        dbl_perimetro = (dbl_lado_base * 2) + (dbl_lado_altura * 2)
        return dbl_perimetro
    }
    
    func CalcularArea() -> Double {
        dbl_area = (dbl_lado_base * dbl_lado_altura)
        return dbl_area
    }
    
    func CalcularVolumen() -> Double {
        dbl_volumen = CalcularArea() * dbl_altura_prisma
        return dbl_volumen
    }
}

class Rombo: Figura
{
    public var dbl_altura_prisma :Double!
    public var dbl_b_menor :Double!
    public var dbl_b_mayor :Double!
    public var dbl_lado :Double!
    //otras
    public var dbl_perimetro :Double!
    public var dbl_area :Double!
    public var dbl_volumen :Double!
    
    init(_ bMenor :Double, _ bMayor :Double, _ AltoPrisma :Double) //volumen
    {
        self.dbl_b_menor = bMenor
        self.dbl_b_mayor = bMayor
        self.dbl_altura_prisma = AltoPrisma
    }
    
    init(_ bMenor :Double, _ bMayor :Double) //area
    {
        self.dbl_b_menor = bMenor
        self.dbl_b_mayor = bMayor
    }
    
    init(_ Lado :Double) //Perimetro
    {
        self.dbl_lado = Lado
    }
    
    func CalcularPerimetro() -> Double {
        dbl_perimetro = (dbl_lado * 4)
        return dbl_perimetro
    }
    
    func CalcularArea() -> Double {
        dbl_area = (dbl_b_mayor * dbl_b_menor) / 2
        return dbl_area
    }
    
    func CalcularVolumen() -> Double {
        dbl_volumen = CalcularArea() * dbl_altura_prisma
        return dbl_volumen
    }
}

class Trapecio: Figura{
    var dbl_baseMayor:Double!
    var dbl_baseMenor:Double!
    var dbl_altura:Double!
    
    //perimetro
    var dbl_lado1:Double!

    //volumen
    var dbl_alturaPrisma:Double!
    
    //otras
    public var dbl_perimetro :Double!
    public var dbl_area :Double!
    public var dbl_volumen :Double!
    
    init(_ BMayor :Double, _ BMenor :Double, _ Altura :Double){ //area
        self.dbl_baseMayor = BMayor
        self.dbl_baseMenor = BMenor
        self.dbl_altura = Altura
    }
    
    init(BMayPerim BMayor :Double, BMenPerim BMenor :Double, L1 Lado1 :Double){ //perimetro
        self.dbl_baseMayor = BMayor
        self.dbl_baseMenor = BMenor
        self.dbl_lado1 = Lado1
    }
    
    init(BMayPerim BMayor :Double, BMenPerim BMenor :Double, Altura Alto :Double, AlturaPrisma AltoPrisma :Double){ //perimetro
        self.dbl_baseMayor = BMayor
        self.dbl_baseMenor = BMenor
        self.dbl_altura = Alto
        self.dbl_alturaPrisma = AltoPrisma
    }
    
    func CalcularArea() -> Double {
        dbl_area = ((self.dbl_baseMayor + self.dbl_baseMenor)/2) * self.dbl_altura
        return dbl_area
    }
    
    func CalcularPerimetro() -> Double {
        dbl_perimetro = (self.dbl_lado1 * 2) + self.dbl_baseMenor + self.dbl_baseMayor
        return dbl_perimetro
    }
    
    func CalcularVolumen() -> Double {
        dbl_volumen = CalcularArea() * self.dbl_alturaPrisma
        return dbl_volumen
    }
}
