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
    @IBOutlet weak var mensajetxt: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var sesion: UIButton!
    
    @IBAction func session(sender: AnyObject) {
        
        //variable of textfield
        let correoU = correo.text!
        let passwordU = password.text!
        
        
        var bandera = false
        
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
                if let email = result.valueForKey("emailUsuario") as? String where email == correoU,
                let password = result.valueForKey("passwdUsuario") as? String where password == passwordU
                {
                    
                    bandera = true
                } //end if
                
                
            }//end for
            
            //Si encontro el usuario manda al segue correcto
            if bandera == true{
                //pasar al segue correcto
                
            } else{
                mensajetxt.text = "El usuario no se encuentra registrado   y/o los datos son incorrectos"
            
            }  //end if
        } //end if

        
        
        
        
    }
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

