//
//  ViewController.swift
//  formCoreData
//
//  Created by Mac27 on 30/03/16.
//  Copyright © 2016 vik. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController {

    @IBOutlet weak var passwd2txt: UITextField!
    @IBOutlet weak var passwdtxt: UITextField!
    @IBOutlet weak var emailtxt: UITextField!
    @IBOutlet weak var sexotxt: UITextField!
    @IBOutlet weak var nombretxt: UITextField!
    
    @IBOutlet weak var validacion: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        

    }
    
   
    @IBAction func registrarse(sender: AnyObject) {
         var bandera = true
        let nombre = nombretxt.text!
        let sexo = sexotxt.text!
        let correo = emailtxt.text!
        let password = passwdtxt.text!
        let password2 = passwd2txt.text!
        
        limpiar()
        // Da acceso a los metos utilizados para el core data
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        //usaremos el context para acceder a la base de datos
        let context:NSManagedObjectContext = appDel.managedObjectContext

        
      
        //hacemos una peticion para traer la entidad
        let request = NSFetchRequest(entityName: "Usuario")
        //Rerorremos el core data
        if let results = try? context.executeFetchRequest(request) where results.count > 0 {
            for result in results {
                //validamos si el Usuario ya tiene el mismo correo electronico
                if let username = result.valueForKey("nombreUsuario") as? String where username == nombre{
                    validacion.text = "El usuario ya exite"
                    bandera = false
                    //print(result.valueForKey("nombreUsuario")!)
                
                } //end if
                
            
            }//end for
            
            
            if bandera == true{
            
                //Ingresamos un usuario a la base de datos del Core data
                let newUser = NSEntityDescription.insertNewObjectForEntityForName("Usuario", inManagedObjectContext: context)
                
                newUser.setValue(nombre, forKey: "nombreUsuario")
                newUser.setValue(sexo, forKey: "sexoUsuario")
                newUser.setValue(correo, forKey: "emailUsuario")
                newUser.setValue(password, forKey: "passwdUsurio")
                newUser.setValue(password2, forKey: "passwd2Usuario")
                
                //Lo guardamos en Core data
                _ = try? context.save()
                //print(results.valueForKey("nombreUsuario")!)
                validacion.text = "Registro Exitoso"
            
            
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
            
                //Lo guardamos en Core data
                _ = try? context.save()
                //print(results.valueForKey("nombreUsuario")!)
                validacion.text = "Registro Exitoso"
            
            
        }//end else

       // print("\(nombre) \(sexo) \(correo) \(password) \(password2)")
        obtener()
    }//end action

    
    func   limpiar(){
        nombretxt.text = ""
        sexotxt.text = ""
        emailtxt.text = ""
        passwdtxt.text = ""
        passwd2txt.text = ""
        
    }
    
    
    func obtener(){
        // Da acceso a los metos utilizados para el core data
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        //usaremos el context para acceder a la base de datos
        let context:NSManagedObjectContext = appDel.managedObjectContext
        //hacemos una peticion para traer la entidad
        let request = NSFetchRequest(entityName: "Usuario")
        if let results = try? context.executeFetchRequest(request) where results.count > 0 {
            for result in results {
                print(result.valueForKey("nombreUsuario")!)
                
            }//end for
        }//end if
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

