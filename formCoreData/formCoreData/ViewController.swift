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
        
//        let nombre = nombretxt.text!
//        let sexo = sexotxt.text!
//        let correo = emailtxt.text!
//        let password = passwdtxt.text!
//        let password2 = passwd2txt.text!
        
        // Da acceso a los metos utilizados para el core data
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        //usaremos el context para acceder a la base de datos
        let context:NSManagedObjectContext = appDel.managedObjectContext
        
        //Ingresamos un usuario a la base de datos del Core data
//        let newUser = NSEntityDescription.insertNewObjectForEntityForName("Usuario", inManagedObjectContext: context)
//        
//        newUser.setValue(nombre, forKey: "nombreUsuario")
//        newUser.setValue(sexo, forKey: "sexoUsuario")
//        newUser.setValue(correo, forKey: "emailUsuario")
//        newUser.setValue(password, forKey: "passwdUsurio")
//        newUser.setValue(password2, forKey: "passwd2Usuario")
//        
//        //Lo guardamos en Core data
//        _ = try? context.save()
        
        
        
        //hacemos una peticion para traer la entidad
        let request = NSFetchRequest(entityName: "Usuario")
        
        if let results = try? context.executeFetchRequest(request) where results.count > 0 {
            for result in results {
                print(result.valueForKey("nombreUsuario"))
            }
        }
        else {
            print("No hay resultados")
        }

       // print("\(nombre) \(sexo) \(correo) \(password) \(password2)")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

