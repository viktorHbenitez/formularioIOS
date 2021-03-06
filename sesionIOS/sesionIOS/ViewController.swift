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

    @IBOutlet weak var resultTxt: UILabel!
    
    @IBOutlet weak var result2txt: UILabel!
    @IBOutlet weak var passwordtxt: UITextField!
    @IBOutlet weak var emailtxt: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Add user in Core Data
        // 1. import Core data
        // 2. tener acceso a los metodos contenidos en appDelegate por medio de variable
//        
//        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
//        
//        // 3. Debemos tener el elemento context ya que nos da acceso a las entedidades creadas 
//        
//         let context:NSManagedObjectContext = appDel.managedObjectContext
//        // 4. accedemos a la bade de dato usando el context asignandolo a una variable
////        let newUser = NSEntityDescription.insertNewObjectForEntityForName("Usuario", inManagedObjectContext: context)
////        // 5. registramos un usuario en la entidad
////        newUser.setValue("viktor", forKey: "nombreUsuario")
////        newUser.setValue("masculino", forKey: "sexoUsuario")
////        newUser.setValue("bbc@hotmail.com", forKey: "emailUsuario")
////        newUser.setValue("1526", forKey: "passwdUsuario")
////        newUser.setValue("1526", forKey: "passwd2Usuario")
////        newUser.setValue("29", forKey: "edadUsuario")
////        newUser.setValue("0", forKey: "lastResult")
////        
////        // 6 . Lo guardamos en el Core Data
////        _ = try? context.save()
//        //hacemos una peticion para traer la entidad
        
    }  //endViewLoad

    
    
    @IBAction func loginUser(sender: AnyObject) {
        
        let mail = emailtxt.text!
        let passwd = passwordtxt.text!
        var bandera = false
        
        //Add user in Core Data
        // 1. import Core data
        // 2. tener acceso a los metodos contenidos en appDelegate por medio de variable
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        // 3. Debemos tener el elemento context ya que nos da acceso a las entedidades creadas
        let context:NSManagedObjectContext = appDel.managedObjectContext
        
        
        //hacemos una peticion para traer la entidad
        let request = NSFetchRequest(entityName: "Usuario")
        //Rerorremos el core data
        if let results = try? context.executeFetchRequest(request) where results.count > 0 {
            for result in results {
                //validamos si el Usuario ya tiene el mismo correo electronico
                if let email = result.valueForKey("emailUsuario") as? String where email == mail,
                let pass = result.valueForKey("passwdUsuario") as? String where pass == passwd
                {
                    bandera = true
                    print("\(bandera)Se encontro al usuario \(email)")
                    
                }
                
                
            }//end for
            
            if bandera == false{
                
                //se crea un objeto de la clase UIAlertController iniciando el estilo con el parametro preferredStyle
                let alertView = UIAlertController (title: "AVISO", message: "El usuario \(mail) no se encuentra registrado y/o la contraseña es incorrecta", preferredStyle: UIAlertControllerStyle.Alert)
                
                //Le indicamos que vamos usar un alertView, usando un elemento de la numeracion del UIAlertControllerStyle
                alertView.addAction(UIAlertAction (title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alertView, animated: false, completion: nil)
                
                
            } //endIf

            
            if bandera == true{
                
                // se ubica en que story_board se va a trabajar
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                // se trae o llama el viewcontroller del story_board seleccionado
                let controller = storyboard.instantiateViewControllerWithIdentifier("viewSiguente") as UIViewController
                // se anima y se trae en animacion haci arriba el NOMBRE_VIEW_CONTROLLER que se llamo
                self.presentViewController(controller, animated: true, completion: nil)
            
            
            } //endif
            
            
            
        } //endif

        

        obtener()
        
    } //endloginUser
    
    

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
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

