//
//  ViewController.swift
//  passingData
//
//  Created by Mac27 on 05/04/16.
//  Copyright © 2016 vik. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    //Crear un array con string
    let numeros = ["1", "2","3"]
    var respuesta:[String] = []
    
    var dato:String?
    
    @IBOutlet weak var labelResult: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

   
    //Implementar el UIPckerView utilizando el array y los metodos delegados y dataSource
    //Metodos data source
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int{
        return 1
    
    }
    func pickerView(pickerView: UIPickerView,numberOfRowsInComponent component: Int) -> Int{
     return numeros.count
    }
    
    //Metodo delegado
    func pickerView(pickerView: UIPickerView, titleForRow row: Int,forComponent component: Int) -> String?{
        return numeros[row]
    
    }
    
    func pickerView(pickerView: UIPickerView,didSelectRow row: Int,inComponent component: Int){
         respuesta.append(numeros[row])
            labelResult.text = numeros[row]
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "transicion"{
            
            let objVista2 = segue.destinationViewController as! SecondViewController
            objVista2.datoRecibido = self.respuesta
            
        
        }
       
    }
    
    
    
    
    
}

