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
    
    var itemToEdit: Item?
    
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
        
        if itemToEdit != nil {
            loadItem(item: itemToEdit!)
        }
        
        
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
    
    
    func loadItem(item: Item) {

        titleLbl.text = item.title
        priceLbl.text = "\(item.price)"
        detailLbl.text = item.details
        
        var index = 0
        repeat {
            
            let s = stores[index]
            if s.name == item.toStore?.name {
                
                picker.selectRow(index, inComponent: 0, animated: false)
                break
            }
            
            index += 1
        
        } while index < stores.count
        

    }
    
    
    @IBAction func saveItem(_ sender: UIButton) {
        
        var item: Item!
        
        if itemToEdit != nil {
            item = itemToEdit
        } else {
            item = Item(context: context)
        }
        
        
        if let title = titleLbl.text {
            item.title = title
        }
        
        if let price = priceLbl.text {
            item.price = (price as NSString).doubleValue
        }
        
        if let detail = detailLbl.text {
            item.details = detail
        }
        
        item.toStore = stores[picker.selectedRow(inComponent: 0)]
            
        ad.saveContext()
        
        _ = navigationController?.popViewController(animated: true)
        
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
