//
//  SecondViewController.swift
//  passingData
//
//  Created by Mac27 on 05/04/16.
//  Copyright © 2016 vik. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var labelTxt: UILabel!
    
    var datoRecibido = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        for dato in datoRecibido{
            print(dato)
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
