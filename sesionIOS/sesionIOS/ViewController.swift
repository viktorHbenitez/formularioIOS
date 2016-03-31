//
//  ViewController.swift
//  sesionIOS
//
//  Created by Mac27 on 31/03/16.
//  Copyright © 2016 vik. All rights reserved.
//

import UIKit
import CoreData


class ViewController: UIViewController {

    @IBOutlet weak var correo: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var sesion: UIButton!
    
    @IBAction func session(sender: AnyObject) {
        
        let corre
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
                if let email = result.valueForKey("emailUsuario") as? String where email == correo,
                let nombreU = result.valueForKey("passwdUsuario") as? String where nombreU==
                {
                    validacion.text = "El usuario con correo \(email) ya existe !!!"
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
                limpiar()
                
                
            } ///end if
            
            
        } //end if

        
        
        
        
    }
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

