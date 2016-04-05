//
//  SecondViewController.swift
//  PasoDatos
//
//  Created by AndresWaldo on 31/03/16.
//  Copyright © 2016 AndresWaldo. All rights reserved.
//

import Foundation
import UIKit

class SecondViewController: UIViewController{
var toPass:String!
    var destInt:[Int]!
    var destInt2:[Int]=[]
    @IBOutlet weak var labelPassedData: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        labelPassedData.text = toPass
        
        for number in destInt {
            print(number)
        }
        
        destInt2=destInt
        for number in destInt2 {
            print(number)
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "segueTestDos" {
            if let destination2 = segue.destinationViewController as? ThirdViewController {
                destination2.destInt3 = self.destInt2
            }
        }
    }

    
}