//
//  FormViewController.swift
//  eyeAppDiagnostic
//
//  Created by Mac27 on 01/04/16.
//  Copyright © 2016 vik. All rights reserved.
//

import UIKit
import CoreData

class FormViewController: UIViewController {

    @IBOutlet weak var emailtxt: UITextField!
    @IBOutlet weak var passwdtxt: UITextField!
    @IBOutlet weak var passwd2txt: UITextField!
    @IBOutlet weak var nombretxt: UITextField!
    @IBOutlet weak var edadtxt: UITextField!
    @IBOutlet weak var generotxt: UITextField!
    @IBOutlet weak var validaciontxt: UILabel!
    @IBOutlet weak var registrarse: UIButton!
    @IBOutlet weak var passtxt: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func registrarse(sender: AnyObject) {
        
        
        var bandera = true
        let nombre = nombretxt.text!
        let sexo = generotxt.text!
        let correo = emailtxt.text!
        let password = passwdtxt.text!
        let password2 = passwd2txt.text!
        let edad = edadtxt.text!
        
        
        // Da acceso a los metos utilizados para el core data
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        //usaremos el context para acceder a la base de datos
        let context:NSManagedObjectContext = appDel.managedObjectContext
        
        //Verifica que las entradas de las contraseñas sean iguales
        if password != password2 {
            passtxt.text = "Las contraseñas no son iguales"
            bandera = false
            validaciontxt.text = ""
        }
        
        //hacemos una peticion para traer la entidad
        let request = NSFetchRequest(entityName: "Usuario")
        //Rerorremos el core data
        if let results = try? context.executeFetchRequest(request) where results.count > 0 {
            for result in results {
                //validamos si el Usuario ya tiene el mismo correo electronico
                if let email = result.valueForKey("emailUsuario") as? String where email == correo
                {
                    validaciontxt.text = "El usuario con correo \(email) ya existe !!!"
                    bandera = false
                    //print(result.valueForKey("nombreUsuario")!)
                    passtxt.text = ""
                    
                }
                
                
                
            }//end for
            
            
            if bandera == true{
                
                //Ingresamos un usuario a la base de datos del Core data
                let newUser = NSEntityDescription.insertNewObjectForEntityForName("Usuario", inManagedObjectContext: context)
                
                newUser.setValue(nombre, forKey: "nombreUsuario")
                newUser.setValue(sexo, forKey: "sexoUsuario")
                newUser.setValue(correo, forKey: "emailUsuario")
                newUser.setValue(password, forKey: "passwdUsurio")
                newUser.setValue(password2, forKey: "passwd2Usuario")
                newUser.setValue(edad, forKey: "edadUsuario")
                newUser.setValue("0", forKey: "lastResult")
                
                
                //Lo guardamos en Core data
                _ = try? context.save()
                //print(results.valueForKey("nombreUsuario")!)
                validaciontxt.text = "Registro Exitoso"
                limpiar()
                
                
            } ///end if
            
            
        } //end if
        else {
            //print("No hay resultados")
            
            //Ingresamos un usuario a la base de datos del Core data
            let newUser = NSEntityDescription.insertNewObjectForEntityForName("Usuario", inManagedObjectContext: context)
            
            newUser.setValue(nombre, forKey: "nombreUsuario")
            newUser.setValue(sexo, forKey: "sexoUsuario")
            newUser.setValue(correo, forKey: "emailUsuario")
            newUser.setValue(password, forKey: "passwdUsurio")
            newUser.setValue(password2, forKey: "passwd2Usuario")
            newUser.setValue(edad, forKey: "edadUsuario")
            newUser.setValue("0", forKey: "lastResult")
            
            
            //Lo guardamos en Core data
            _ = try? context.save()
            //print(results.valueForKey("nombreUsuario")!)
            validaciontxt.text = "Registro Exitoso"
            limpiar()
            
        }//end else
        
        // print("\(nombre) \(sexo) \(correo) \(password) \(password2)")
        obtener()
        
    }
    
    
    
    func   limpiar(){
        nombretxt.text = ""
        generotxt.text = ""
        emailtxt.text = ""
        passwdtxt.text = ""
        passwd2txt.text = ""
        edadtxt.text = ""
        passtxt.text = ""
//        validaciontxt.text = ""
        
    } //endLimpiar
    
    
    func obtener(){
        // Da acceso a los metos utilizados para el core data
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        //usaremos el context para acceder a la base de datos
        let context:NSManagedObjectContext = appDel.managedObjectContext
        
        print("USUARIOS ALMACENADOS EN CORE DATA")
        //hacemos una peticion para traer la entidad
        let request = NSFetchRequest(entityName: "Usuario")
        if let results = try? context.executeFetchRequest(request) where results.count > 0 {
            for result in results {
                print(result)
                
            }//end for
        }//end if
        
    } //end obtener

    
   
} //endClass
