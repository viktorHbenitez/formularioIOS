//
//  sessionViewController.swift
//  eyeAppDiagnostic
//
//  Created by Mac22 on 01/04/16.
//  Copyright © 2016 vik. All rights reserved.
//

import UIKit
import CoreData



class sessionViewController: UIViewController {

    @IBOutlet weak var emailtxt: UITextField!
    @IBOutlet weak var passwordtxt: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
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
                    let pass = result.valueForKey("passwdUsurio") as? String where pass == passwd
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
        
    }  //endLoginUser
    
    
    
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
    

    
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
