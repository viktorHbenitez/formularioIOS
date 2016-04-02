//
//  ViewController.swift
//  inicioSesion
//
//  Created by Mac22 on 01/04/16.
//  Copyright © 2016 viktor. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let context:NSManagedObjectContext = appDel.managedObjectContext
        
        let newUser = NSEntityDescription.insertNewObjectForEntityForName("Usuario", inManagedObjectContext: context)
        
        newUser.setValue("cholo@hotmail.com", forKey: "emailUsuario")
        newUser.setValue("pass", forKey: "passwdUsurio")
        
        _ = try? context.save()
        
        let request = NSFetchRequest(entityName: "Usuario")
        
        let results = try? context.executeFetchRequest(request)
        print(results)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

