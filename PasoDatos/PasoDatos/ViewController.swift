//
//  ViewController.swift
//  PasoDatos
//
//  Created by AndresWaldo on 31/03/16.
//  Copyright © 2016 AndresWaldo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate,UIPickerViewDataSource{
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var myLabel: UILabel!
    
    var myInformation:[Int] = []
    var pickerDataSource = ["White", "Red", "Green", "Blue"];
    let pickerData = ["1","4","5"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Connect data:
        pickerView.delegate = self
        pickerView.dataSource = self
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "segueTest" {
            if let destination = segue.destinationViewController as? SecondViewController {
                destination.destInt = self.myInformation
            }
        }
    }
    
    /*override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "segueTest") {
            let svc = segue.destinationViewController as! SecondViewController;
            
        
            svc.toPass = myLabel.text
            
        }
    }*/
    
    //MARK: - Delegates and data sources
    //MARK: Data Sources
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    //MARK: Delegates
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        myInformation.append(Int(pickerData[row])!)
        myLabel.text = pickerData[row]
    }
    
    
    
}


