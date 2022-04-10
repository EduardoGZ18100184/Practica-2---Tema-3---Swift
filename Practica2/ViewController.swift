//
//  ViewController.swift
//  Practica2
//
//  Created by Eduardo Gomez on 06/04/22.
//

import UIKit
import Foundation
var strFigura = "Circulo"//variable global para almacenar la figura
var strRadio = ""

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    //UIViewController
    
    @IBOutlet weak var pkvFigura: UIPickerView!
    
    @IBOutlet weak var lblResultado: UILabel!
    @IBOutlet weak var lblDatosFig: UILabel!
    
    @IBOutlet weak var imgFiguras: UIImageView!
    
    //08-04-2022 Examen
    @IBOutlet weak var stpR: UISlider!
    @IBOutlet weak var stpG: UISlider!
    @IBOutlet weak var stpB: UISlider!
    
    @IBOutlet weak var txtRed: UITextField!
    @IBOutlet weak var txtGreen: UITextField!
    @IBOutlet weak var txtBlue: UITextField!
    
    //@IBOutlet weak var txtRojo: UITextField!
    @IBAction func txtRojo(_ sender: Any) {
        let rojo = Double(txtRed.text ?? "")
        if rojo == nil{
            return
        }else{
            stpR.value = Float(rojo!)
            ActualizarColor()
        }
    }
    
    @IBAction func txtVerde(_ sender: Any) {
        let verde = Double(txtGreen.text!)
        if verde == nil{
            return
        }else{
            stpG.value = Float(verde!)
            ActualizarColor()
        }
    }
    
    @IBAction func txtAzul(_ sender: Any) {
        let azul = Double(txtBlue.text!)
        if azul == nil{
            return
        }else{
            stpB.value = Float(azul!)
            ActualizarColor()
        }
    }
    
    
    @IBAction func Red(_ sender: Any) {
        txtRed.text = String(stpR.value)
        ActualizarColor()
    }
    
    @IBAction func Gren(_ sender: Any) {
        txtGreen.text = String(stpG.value)
        ActualizarColor()
    }
    
    @IBAction func Blue(_ sender: Any) {
        txtBlue.text = String(stpB.value)
        ActualizarColor()
    }
    
    func ActualizarColor(){
        var Red = stpR.value
        var Green = stpG.value
        var Blue = stpB.value
        txtRed.text = String(stpR.value)
        txtGreen.text = String(stpG.value)
        txtBlue.text = String(stpB.value)
        //pkvFigura.backgroundColor = UIColor(red: (CGFloat(Red)/255), green: (CGFloat(Green)/255), blue: (CGFloat(Blue)/255), alpha: (255/255))
        pkvFigura.backgroundColor = UIColor(Red: Double(Red), Green: Double(Green), Blue: Double(Blue))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pkvFigura.delegate = self
        pkvFigura.dataSource = self
        //lblDatosFig.text = "Datos de la figura : Circulo" //al iniciar tiene un circulo
        pickerView(pkvFigura, didSelectRow: 0, inComponent: 1)
        imgFiguras.image = UIImage(named: strFigura)
        
        ActualizarColor()
        // Do any additional setup after loading the view.
    }
    
    //numero de columnas, constante de 1 sola columna
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //numero de renglones, los obtiene del arreglo de figuras
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return nomFiguras.count
    }
    
    //Titulo de los renglones del pkv
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return nomFiguras[row]
    }
    
    //cuando se selecciona un renglon del PickerView
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //pkvColores.backgroundColor = colores[row].color
        
        strFigura = nomFiguras[row]
        lblDatosFig.text = "Datos de la figura : \(strFigura)"
        lblResultado.text = "Resultados:"
        imgFiguras.image = UIImage(named: strFigura)
    }

    @IBAction func alertaPerimetro(_ sender: UIBarButtonItem) {
     let figuraSeleccionada =  "\(nomFiguras[pkvFigura.selectedRow(inComponent: 0)])"
     
     let alerta = UIAlertController(title: "Perimetro", message: "Formulario de datos", preferredStyle: .alert)
     
     switch figuraSeleccionada {
     case "Circulo":
         alerta.addTextField{
             (txtRadio) in txtRadio.placeholder = "Radio"
         }
     case "Triangulo":
         alerta.addTextField{
             (txtLadoA) in txtLadoA.placeholder = "Base"
         }
         alerta.addTextField{
             (txtLadoA) in
             txtLadoA.placeholder = "LadoA"
         }
         alerta.addTextField{
             (txtLadoB) in
             txtLadoB.placeholder = "LadoB"
         }
     case "Cuadrado":
         alerta.addTextField{
             (txtLado) in txtLado.placeholder = "Lado"
         }
     case "Rectangulo":
         alerta.addTextField{
             (txtBase) in
             txtBase.placeholder = "Base"
         }
         alerta.addTextField{
             (txtAltura) in txtAltura.placeholder = "Altura"
         }
     case "Trapecio":
         alerta.addTextField{
             (txtBaseMayor) in txtBaseMayor.placeholder = "Base mayor"
         }
         alerta.addTextField{
             (txtBaseMenor) in txtBaseMenor.placeholder = "Base menor"
         }
         alerta.addTextField{
             (txtLado) in txtLado.placeholder = "Lados"
         }
     case "Rombo":
         alerta.addTextField{
             (txtLado) in txtLado.placeholder = "Lados"
         }
     default:
         self.lblResultado.text = "Figura no configurada"
     }
     let btnCancelar = UIAlertAction(title: "Cancelar", style: .cancel)
     let btnCalcular = UIAlertAction(title: "Calcular", style: .default, handler: {
         _ in switch figuraSeleccionada {
         case "Circulo":
             let radio = Double (alerta.textFields![0].text!)
             if radio == nil {
                 self.ErrorDatos()
                 return
             }
             
             let miCirculo = Circulo(radioArea: radio!)
             self.lblDatosFig.text = "Datos de la figura : \(figuraSeleccionada) \nEl radio es de: \(miCirculo.dbl_radio!)"
             self.lblResultado.text = "Perimetro:  \(miCirculo.CalcularPerimetro())"
         case "Triangulo":
             let base = Double (alerta.textFields![0].text!)
             let ladoA = Double(alerta.textFields![1].text!)
             let ladoB = Double(alerta.textFields![2].text!)
             if base == nil || ladoA == nil || ladoB == nil {
                 self.ErrorDatos()
                 return
             }
             
             let triangulo = Triangulo(AnchoL3: base!, Lado2: ladoA!, Lado1: ladoB!)
             self.lblDatosFig.text = "Datos de la figura : \(figuraSeleccionada) \nBase: \(triangulo.dbl_ancho!)\nLadoA: \(triangulo.dbl_lado1!)\nLadoB: \(triangulo.dbl_lado2!)"
             self.lblResultado.text = "Perimetro: \(triangulo.CalcularPerimetro())"
         case "Cuadrado":
             let lado = Double (alerta.textFields![0].text!)
             if lado == nil{
                 self.ErrorDatos()
                 return
             }
             
             let cuadrado = Cuadrado(LadoPerimetro: lado!)
             self.lblDatosFig.text = "Datos de la figura : \(figuraSeleccionada) \nLado: \(cuadrado.dbl_lado!)"
             self.lblResultado.text = "Perimetro: \(cuadrado.CalcularPerimetro())"
         case "Rectangulo":
             let base = Double (alerta.textFields![0].text!)
             let altura = Double(alerta.textFields![1].text!)
             if base == nil || altura == nil {
                 self.ErrorDatos()
                 return
             }
             
             let rectangulo = Rectangulo(LadoPerim: base!, LAlturaPerim: altura!)
             self.lblDatosFig.text = "Datos de la figura : \(figuraSeleccionada) \nBase: \(rectangulo.dbl_lado_base!)\nAltura: \(rectangulo.dbl_lado_altura!)"
             self.lblResultado.text = "Perimetro: \(rectangulo.CalcularPerimetro())"
         case "Trapecio":
             let baseMayor = Double (alerta.textFields![0].text!)
             let baseMenor = Double(alerta.textFields![1].text!)
             let lados = Double(alerta.textFields![2].text!)
             if baseMenor == nil || baseMayor == nil || lados == nil {
                 self.ErrorDatos()
                 return
             }
             
             let trapecio = Trapecio(BMayPerim: baseMayor!, BMenPerim: baseMenor!, L1: lados!)
             self.lblDatosFig.text = "Datos de la figura : \(figuraSeleccionada) \nBase Mayor: \(trapecio.dbl_baseMayor!)\nBase Menor: \(trapecio.dbl_baseMenor!)\nLados: \(trapecio.dbl_lado1!)"
             self.lblResultado.text = "Perimetro: \(trapecio.CalcularPerimetro())"
         case "Rombo":
             let Lados = Double (alerta.textFields![0].text!)
             if Lados == nil {
                 self.ErrorDatos()
                 return
             }
             
             let rombo = Rombo(Lados!)
             self.lblDatosFig.text = "Datos de la figura : \(figuraSeleccionada) \nLados: \(rombo.dbl_lado!)"
             self.lblResultado.text = "Perimetro: \(rombo.CalcularPerimetro())"
         default:
             self.lblResultado.text = "Error al calcular el perimetro"
         }

     })
     alerta.addAction(btnCancelar)
     alerta.addAction(btnCalcular)
     self.present(alerta, animated: true, completion: nil)
    }
    
    @IBAction func alertaArea(_ sender: UIBarButtonItem) {
        let figuraSeleccionada =  "\(nomFiguras[pkvFigura.selectedRow(inComponent: 0)])"
        
        let alerta = UIAlertController(title: "Area", message: "Formulario de datos", preferredStyle: .alert)
        
        switch figuraSeleccionada {
        case "Circulo":
            alerta.addTextField{
                (txtRadio) in txtRadio.placeholder = "Radio"
            }
        case "Triangulo":
            alerta.addTextField{
                (txtLadoA) in txtLadoA.placeholder = "Base"
            }
            alerta.addTextField{
                (txtLadoB) in
                txtLadoB.placeholder = "Altura"
            }
        case "Cuadrado":
            alerta.addTextField{
                (txtLado) in txtLado.placeholder = "Lado"
            }
        case "Rectangulo":
            alerta.addTextField{
                (txtBase) in
                txtBase.placeholder = "Base"
            }
            alerta.addTextField{
                (txtAltura) in txtAltura.placeholder = "Altura"
            }
        case "Trapecio":
            alerta.addTextField{
                (txtBaseMayor) in txtBaseMayor.placeholder = "Base mayor"
            }
            alerta.addTextField{
                (txtBaseMenor) in txtBaseMenor.placeholder = "Base menor"
            }
            alerta.addTextField{
                (txtAltura) in txtAltura.placeholder = "Altura"
            }
        case "Rombo":
            alerta.addTextField{
                (txtBaseMayor) in txtBaseMayor.placeholder = "D mayor"
            }
            alerta.addTextField{
                (txtBaseMenor) in txtBaseMenor.placeholder = "D menor"
            }
        default:
            self.lblResultado.text = "Figura no configurada"
        }
        let btnCancelar = UIAlertAction(title: "Cancelar", style: .cancel)
        let btnCalcular = UIAlertAction(title: "Calcular", style: .default, handler: {
            _ in switch figuraSeleccionada {
            case "Circulo":
                let radio = Double (alerta.textFields![0].text!)
                if radio == nil {
                    self.ErrorDatos()
                    return
                }
                
                let miCirculo = Circulo(radioArea: radio!)
                self.lblDatosFig.text = "Datos de la figura : \(figuraSeleccionada) \nEl radio es de: \(miCirculo.dbl_radio!)"
                self.lblResultado.text = "Area:  \(miCirculo.CalcularArea())"
            case "Triangulo":
                let base = Double (alerta.textFields![0].text!)
                let altura = Double(alerta.textFields![1].text!)
                if base == nil || altura == nil {
                    self.ErrorDatos()
                    return
                }
                
                let triangulo = Triangulo(base!, altura!)
                self.lblDatosFig.text = "Datos de la figura : \(figuraSeleccionada) \nBase: \(triangulo.dbl_ancho!), Altura: \(triangulo.dbl_altura_base!)"
                self.lblResultado.text = "Area: \(triangulo.CalcularArea())"
            case "Cuadrado":
                let lado = Double (alerta.textFields![0].text!)
                if lado == nil{
                    self.ErrorDatos()
                    return
                }
                
                let cuadrado = Cuadrado(LadoArea: lado!)
                self.lblDatosFig.text = "Datos de la figura : \(figuraSeleccionada) \nLado: \(cuadrado.dbl_lado!)"
                self.lblResultado.text = "Area \(cuadrado.CalcularArea())"
            case "Rectangulo":
                let base = Double (alerta.textFields![0].text!)
                let altura = Double(alerta.textFields![1].text!)
                if base == nil || altura == nil {
                    self.ErrorDatos()
                    return
                }
                
                let rectangulo = Rectangulo(LadoArea: base!, LadoAlturaArea: altura!)
                self.lblDatosFig.text = "Datos de la figura : \(figuraSeleccionada) \nBase: \(rectangulo.dbl_lado_base!), Altura: \(rectangulo.dbl_lado_altura!)"
                self.lblResultado.text = "Area: \(rectangulo.CalcularArea())"
            case "Trapecio":
                let baseMayor = Double (alerta.textFields![0].text!)
                let baseMenor = Double(alerta.textFields![1].text!)
                let altura = Double(alerta.textFields![2].text!)
                if baseMenor == nil || baseMayor == nil || altura == nil {
                    self.ErrorDatos()
                    return
                }
                
                let trapecio = Trapecio(baseMayor!, baseMenor!, altura!)
                self.lblDatosFig.text = "Datos de la figura : \(figuraSeleccionada) \nBase Mayor: \(trapecio.dbl_baseMayor!), Base Menor: \(trapecio.dbl_baseMenor!), Altura: \(trapecio.dbl_altura!)"
                self.lblResultado.text = "Area: \(trapecio.CalcularArea())"
            case "Rombo":
                let baseMayor = Double (alerta.textFields![0].text!)
                let baseMenor = Double(alerta.textFields![1].text!)
                if baseMenor == nil || baseMayor == nil{
                    self.ErrorDatos()
                    return
                }
                
                let rombo = Rombo(baseMenor!, baseMayor!)
                self.lblDatosFig.text = "Datos de la figura : \(figuraSeleccionada) \nBase Mayor: \(rombo.dbl_b_mayor!), Base Menor: \(rombo.dbl_b_menor!)"
                self.lblResultado.text = "Area: \(rombo.CalcularArea())"
            default:
                self.lblResultado.text = "Error al calcular el area"
            }

        })
        alerta.addAction(btnCancelar)
        alerta.addAction(btnCalcular)
        self.present(alerta, animated: true, completion: nil)
    }
    
    
    @IBAction func AlertaVolumen(_ sender: UIBarButtonItem) {
        let figuraSeleccionada =  "\(nomFiguras[pkvFigura.selectedRow(inComponent: 0)])"
        
        let alerta = UIAlertController(title: "Volumen", message: "Formulario de datos", preferredStyle: .alert)
        
        switch figuraSeleccionada {
        case "Circulo":
            alerta.addTextField{
                (txtRadio) in txtRadio.placeholder = "Radio"
            }
            alerta.addTextField{
                (txtAltura) in txtAltura.placeholder = "Altura"
            }
        case "Triangulo":
            alerta.addTextField{
                (txtLadoA) in txtLadoA.placeholder = "Base"
            }
            alerta.addTextField{
                (txtLadoB) in
                txtLadoB.placeholder = "Altura"
            }
            alerta.addTextField{
                (txtAlturaV) in
                txtAlturaV.placeholder = "Altura Volumen"
            }
        case "Cuadrado":
            alerta.addTextField{
                (txtLado) in txtLado.placeholder = "Lado"
            }
            alerta.addTextField{
                (txtAlturaV) in
                txtAlturaV.placeholder = "Altura Volumen"
            }
        case "Rectangulo":
            alerta.addTextField{
                (txtBase) in
                txtBase.placeholder = "Base"
            }
            alerta.addTextField{
                (txtAltura) in txtAltura.placeholder = "Altura"
            }
            alerta.addTextField{
                (txtAlturaV) in
                txtAlturaV.placeholder = "Altura Volumen"
            }
        case "Trapecio":
            alerta.addTextField{
                (txtBaseMayor) in txtBaseMayor.placeholder = "Base mayor"
            }
            alerta.addTextField{
                (txtBaseMenor) in txtBaseMenor.placeholder = "Base menor"
            }
            alerta.addTextField{
                (txtAltura) in txtAltura.placeholder = "Altura"
            }
            alerta.addTextField{
                (txtLargo) in
                txtLargo.placeholder = "Altura Prisma"
            }
        case "Rombo":
            alerta.addTextField{
                (txtBaseMayor) in txtBaseMayor.placeholder = "D mayor"
            }
            alerta.addTextField{
                (txtBaseMenor) in txtBaseMenor.placeholder = "D menor"
            }
            alerta.addTextField{
                (txtAlturaV) in
                txtAlturaV.placeholder = "Altura Prisma"
            }
        default:
            self.lblResultado.text = "Figura no configurada"
        }
        let btnCancelar = UIAlertAction(title: "Cancelar", style: .cancel)
        let btnCalcular = UIAlertAction(title: "Calcular", style: .default, handler: {
            _ in switch figuraSeleccionada {
            case "Circulo":
                let radio = Double (alerta.textFields![0].text!)
                let altura = Double (alerta.textFields![1].text!)
                if radio == nil || altura == nil {
                    self.ErrorDatos()
                    return
                }
                
                let miCirculo = Circulo(radioVolumen: radio!, alturaVolumen: altura!)
                self.lblDatosFig.text = "Datos de la figura : \(figuraSeleccionada) \nEl radio es de: \(miCirculo.dbl_radio!)nLa altura del cilindro es de:"
                self.lblResultado.text = "Volumen:  \(miCirculo.CalcularVolumen())"
            case "Triangulo":
                let base = Double (alerta.textFields![0].text!)
                let altura = Double(alerta.textFields![1].text!)
                let alturaPrisma = Double(alerta.textFields![2].text!)
                if base == nil || altura == nil || alturaPrisma == nil {
                    self.ErrorDatos()
                    return
                }
                
                let triangulo = Triangulo(base!, altura!, alturaPrisma!)
                self.lblDatosFig.text = "Datos de la figura : \(figuraSeleccionada) \nBase: \(triangulo.dbl_ancho!)\nAltura: \(triangulo.dbl_altura_base!)\nAltura del prisma: \(triangulo.dbl_altura_prisma!)"
                self.lblResultado.text = "Volumen: \(triangulo.CalcularVolumen())"
            case "Cuadrado":
                let lado = Double (alerta.textFields![0].text!)
                let alturaPrisma = Double (alerta.textFields![1].text!)
                if lado == nil || alturaPrisma == nil {
                    self.ErrorDatos()
                    return
                }
                
                let cuadrado = Cuadrado(lado!, alturaPrisma!)
                self.lblDatosFig.text = "Datos de la figura : \(figuraSeleccionada) \nLado: \(cuadrado.dbl_lado!)\nAltura Prisma: \(cuadrado.dbl_altura_prisma!)"
                self.lblResultado.text = "Volumen: \(cuadrado.CalcularVolumen())"
            case "Rectangulo":
                let base = Double (alerta.textFields![0].text!)
                let altura = Double(alerta.textFields![1].text!)
                let alturaPrisma = Double(alerta.textFields![2].text!)
                if base == nil || altura == nil || alturaPrisma == nil{
                    self.ErrorDatos()
                    return
                }
                
                let rectangulo = Rectangulo(base!, altura!, alturaPrisma!)
                self.lblDatosFig.text = "Datos de la figura : \(figuraSeleccionada)\nBase: \(rectangulo.dbl_lado_base!)\nAltura: \(rectangulo.dbl_lado_altura!)\nAltura Prisma: \(rectangulo.dbl_altura_prisma!)"
                self.lblResultado.text = "Volumen: \(rectangulo.CalcularVolumen())"
            case "Trapecio":
                let baseMayor = Double (alerta.textFields![0].text!)
                let baseMenor = Double(alerta.textFields![1].text!)
                let altura = Double(alerta.textFields![2].text!)
                let alturaPrisma = Double(alerta.textFields![3].text!)
                if baseMenor == nil || baseMayor == nil || altura == nil || alturaPrisma == nil {
                    self.ErrorDatos()
                    return
                }
                
                let trapecio = Trapecio(BMayPerim: baseMayor!, BMenPerim: baseMenor!, Altura: altura!, AlturaPrisma: alturaPrisma!)
                self.lblDatosFig.text = "Datos de la figura : \(figuraSeleccionada) \nBase Mayor: \(trapecio.dbl_baseMayor!)\nBase Menor: \(trapecio.dbl_baseMenor!)\nAltura: \(trapecio.dbl_altura!)nAltura Prisma: \(trapecio.dbl_alturaPrisma!)"
                self.lblResultado.text = "Volumen: \(trapecio.CalcularVolumen())"
            case "Rombo":
                let baseMayor = Double (alerta.textFields![0].text!)
                let baseMenor = Double(alerta.textFields![1].text!)
                let alturaPrisma = Double(alerta.textFields![2].text!)
                if baseMenor == nil || baseMayor == nil || alturaPrisma == nil {
                    self.ErrorDatos()
                    return
                }
                
                let rombo = Rombo(baseMenor!, baseMayor!, alturaPrisma!)
                self.lblDatosFig.text = "Datos de la figura : \(figuraSeleccionada) \nBase Mayor: \(rombo.dbl_b_mayor!)\nBase Menor: \(rombo.dbl_b_menor!)\nAltura Pirsma \(rombo.dbl_altura_prisma!)"
                self.lblResultado.text = "Volumen: \(rombo.CalcularVolumen())"
            default:
                self.lblResultado.text = "Error al calcular el area"
            }

        })
        alerta.addAction(btnCancelar)
        alerta.addAction(btnCalcular)
        self.present(alerta, animated: true, completion: nil)
    }
    
    func ErrorDatos()
    {
        self.lblResultado.text = "Ingrese datos validos"
        self.lblDatosFig.text = "Datos de la figura : \(strFigura)"
    }
}


