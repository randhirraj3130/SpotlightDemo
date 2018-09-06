//
//  ViewController.swift
//  CoreSpotLightDemo
//
//  Created by Randhir raj on 9/6/18.
//  Copyright © 2018 Randhir raj. All rights reserved.
//

import UIKit
import CoreSpotlight
import MobileCoreServices

class ViewController: UIViewController {
    
    @IBOutlet weak var HolderTabeView: UITableView!
    let ResturentArray = ["Amit","Randhir","Roushan","Anish","Vishal"]
    let ResturentDescArray = ["Awesome Resturent","Super Resturent","Wonderful  Resturent","Average Resturent","Good Resturent"]
    
    //let identifier = "CoreSpotLightDemo"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.HolderTabeView.delegate = self
        self.HolderTabeView.dataSource  = self
        self.HolderTabeView.reloadData()
        self.AddMultipleData()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.title = "Resturent List"
        // self.AddSingleData()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.title = ""
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func ShowData(Index:Int){
        
        let DestVC:ShowDescriptionVC = self.storyboard?.instantiateViewController(withIdentifier: "ShowDescriptionVC") as! ShowDescriptionVC
        DestVC.DescIndex = Index
        self.navigationController?.pushViewController(DestVC, animated: true)
    }
    
    //    func AddSingleData(){
    //
    //        let attributeSet = CSSearchableItemAttributeSet(itemContentType: kUTTypeText as String)
    //        attributeSet.title = "Randnir"
    //        attributeSet.contentDescription = "CoreSpotLight demo tutorial"
    //
    //        let item = CSSearchableItem(uniqueIdentifier: identifier, domainIdentifier: "com.randhir", attributeSet: attributeSet)
    //        CSSearchableIndex.default().indexSearchableItems([item]) { error in
    //            if let error = error {
    //                print("Indexing error: \(error.localizedDescription)")
    //            } else {
    //                print("Search item successfully indexed!")
    //            }
    //        }
    //    }
    
    func AddMultipleData(){
        
        var identifier = ""
        for i in 0...self.ResturentArray.count-1{
            identifier = "\(i)"
            let attributeSet = CSSearchableItemAttributeSet(itemContentType: kUTTypeText as String)
            attributeSet.title = self.ResturentArray[i]
            attributeSet.contentDescription = self.ResturentDescArray[i]
            let item = CSSearchableItem(uniqueIdentifier: identifier, domainIdentifier: "com.randhir", attributeSet: attributeSet)
            CSSearchableIndex.default().indexSearchableItems([item]) { error in
                if let error = error {
                    print("Indexing error: \(error.localizedDescription)")
                } else {
                    print("Search item successfully indexed!")
                }
            }
            
        }
        
    }
    
    
}
extension ViewController:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : DemoCell = tableView.dequeueReusableCell(withIdentifier: "DemoCell", for: indexPath) as! DemoCell
        cell.CellTitle.text = self.ResturentArray[indexPath.row]
        cell.CellDescLabel.text = self.ResturentDescArray[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 75
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let DestVC:ShowDescriptionVC = self.storyboard?.instantiateViewController(withIdentifier: "ShowDescriptionVC") as! ShowDescriptionVC
        DestVC.DescIndex = indexPath.row
        self.navigationController?.pushViewController(DestVC, animated: true)
    }

}

