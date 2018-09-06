//
//  ShowDescriptionVC.swift
//  CoreSpotLightDemo
//
//  Created by Randhir raj on 9/6/18.
//  Copyright © 2018 Randhir raj. All rights reserved.
//

import UIKit

class ShowDescriptionVC: UIViewController {

    var DescIndex:Int = -1
    @IBOutlet weak var DescTextView: UITextView!
     let ResturentDescArray = ["Awesome Resturent","Super Resturent","Wonderful  Resturent","Average Resturent","Good Resturent"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.DescTextView.isEditable = false
        
        if self.DescIndex != -1{
            self.DescTextView.text = self.ResturentDescArray[DescIndex]
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.title = "Details"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
