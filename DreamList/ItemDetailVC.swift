//
//  ItemDetailVC.swift
//  DreamList
//
//  Created by Neven on 28/01/2017.
//  Copyright © 2017 Neven. All rights reserved.
//

import UIKit
import CoreData

class ItemDetailVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    @IBOutlet weak var titleLbl: CustomTextField!
    @IBOutlet weak var priceLbl: CustomTextField!
    @IBOutlet weak var detailLbl: CustomTextField!
    @IBOutlet weak var picker: UIPickerView!
    
    var stores = [Store]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker.dataSource = self
        picker.delegate = self

        if let topItem = self.navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil , action: nil)
        }
        
//        generalTest()
        fetchStore()
        
    }


    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return stores.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let store = stores[row]
        return store.name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // Update Store Name
    }
    
    func fetchStore() {
        
        let request : NSFetchRequest<Store> = Store.fetchRequest()
        
        do {
            self.stores = try context.fetch(request)
            self.picker.reloadAllComponents()
        } catch {
        
        }
        
    }
    
    func generalTest() {
        
        let store1 = Store(context: context)
        store1.name = "Best Buy"
        let store2 = Store(context: context)
        store2.name = "Tesla Dealership"
        let store3 = Store(context: context)
        store3.name = "Frys Electronics"
        let store4 = Store(context: context)
        store4.name = "Target"
        let store5 = Store(context: context)
        store5.name = "Amazon"
        let store6 = Store(context: context)
        store6.name = "K Mart"
        
        ad.saveContext()
        
    }
    
    
    
}
