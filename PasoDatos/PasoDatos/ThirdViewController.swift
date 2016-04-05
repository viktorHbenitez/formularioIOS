//
//  ThirdViewController.swift
//  PasoDatos
//
//  Created by Mac25 on 05/04/16.
//  Copyright © 2016 AndresWaldo. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    var destInt3:[Int]!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for number in destInt3 {
            print("hola \(number)")
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
