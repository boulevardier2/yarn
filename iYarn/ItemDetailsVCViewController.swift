//
//  ItemDetailsVCViewController.swift
//  iYarn
//
//  Created by Jason Larkin on 10/21/16.
//  Copyright © 2016 Jason Larkin. All rights reserved.
//

import UIKit
import CoreData

class ItemDetailsVCViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var storePicker: UIPickerView!
    @IBOutlet weak var titleField: CustomTextField!
    @IBOutlet weak var priceField: CustomTextField!
    @IBOutlet weak var detailsField: CustomTextField!
    

   
    var stores = [Store]()
    var itemToEdit: Item?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        storePicker.delegate = self
        storePicker.dataSource = self
        
      //  let store = Store (context: context)
      //  store.name = "Walmart"
      //  let store2 = Store (context: context)
       // store2.name = "K Mart"
      //  let store3 = Store (context: context)
       // store3.name = "Michaels"
       // let store4 = Store (context: context)
        //store4.name = "Hobby Lobby"
        //let store5 = Store (context: context)
        //store5.name = "A C Moore"
        //let store6 = Store (context: context)
        //store6.name = "Ben Franklins"
        //let store7 = Store (context: context)
        //store7.name = "Jo Anns"
        
        //ad.saveContext()
        getStores()
        
    
    if itemToEdit != nil {
         loadItemData()
    }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let store = stores [row]
        return store.name
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return stores.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
    }
    
    func getStores() {
        
        let fetchRequest: NSFetchRequest<Store> = Store.fetchRequest()
        
        do {
            self.stores = try context.fetch (fetchRequest)
            self.storePicker.reloadAllComponents()
        }
        catch {
            //handle the error
        }
    }
    
    @IBAction func savePressed(_ sender: UIButton) {
        
        let item = Item (context: context)
        
        if let title = titleField.text {
            item.title = title
        }
        if let price = priceField.text {
        
           item.price = (price as NSString).doubleValue
    }
        if let details = detailsField.text {
            
           item.details = details
        }
    
     item.toStore = stores [storePicker.selectedRow(inComponent: 0)]
        
        ad.saveContext()
        
        _ = navigationController?.popViewController(animated: true)
}
    func loadItemData() {
        
        if let item = itemToEdit {
            titleField.text = item.title
            priceField.text = "\(item.price)"
            detailsField.text = item.details
            
            if let store = item.toStore {
                var index = 0
                
                repeat {
                    let s = stores [index]
                    if s.name == store.name {
                        
                    storePicker.selectRow (index, inComponent: 0, animated: false)
                        break
                        
                    }
                    index += 1
                    
                    
                } while (index < stores.count) }
                
}
}
        

    

}

