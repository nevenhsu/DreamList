//
//  ViewController.swift
//  DreamList
//
//  Created by Neven on 22/01/2017.
//  Copyright © 2017 Neven. All rights reserved.
//

import UIKit
import CoreData

class mainVC: UIViewController,UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segment: UISegmentedControl!
    var itemFRC: NSFetchedResultsController<Item>!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
        
//        generateTest()
        attemptFetch()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
        updateCell(cell: cell, index: indexPath as NSIndexPath)
        return cell
        
    }
    
    func updateCell(cell:ItemCell, index: NSIndexPath) {
        let item = itemFRC.object(at: index as IndexPath)
        cell.updateUI(item: item)
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let sections = itemFRC.sections {
            let sectionInfo = sections[section]
            return sectionInfo.numberOfObjects
        }
        
        return 0
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        if let sections = itemFRC.sections {
            return sections.count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 172
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let objs = itemFRC.fetchedObjects, objs.count > 0 {
            let item = objs[indexPath.row]
            performSegue(withIdentifier: "ItemDetailVC", sender: item)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ItemDetailVC" {
            if let destinationVC = segue.destination as? ItemDetailVC {
                destinationVC.itemToEdit = sender as? Item
            }
        }
    }

    func attemptFetch() {
    
        let fetchRequest: NSFetchRequest<Item> = Item.fetchRequest()
        let dateSort: NSSortDescriptor = NSSortDescriptor(key: "created", ascending: false)
        fetchRequest.sortDescriptors = [dateSort]
        
        itemFRC = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        
        itemFRC.delegate = self
            
        do {
            
            try itemFRC.performFetch()
            
        } catch {
            let error = error as NSError
            print(error.debugDescription)
        }
    }
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
            
        case .insert :
            if let indexPath = newIndexPath {
                tableView.insertRows(at: [indexPath], with: .fade)
            }
            
        case .delete:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            
        case .move:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            if let indexPath = newIndexPath {
                tableView.insertRows(at: [indexPath], with: .fade)
            }
            
        case .update:
            if let indexPath = indexPath {
                let cell = tableView.cellForRow(at: indexPath) as! ItemCell
                updateCell(cell: cell, index: indexPath as NSIndexPath)
            }
            
            
        }
    }
    
    
    func generateTest() {
        
        let item1 = Item(context: context)
        item1.title = "MacBook Pro"
        item1.price = 1800
        item1.details = "I can't wait until the September event, I hope they release new MPBs"
        
        let item2 = Item(context: context)
        item2.title = "Bose Headphones"
        item2.price = 300
        item2.details = "But man, its so nice to be able to blaock out everyone with the noise canceling tech."
        
        let item3 = Item(context: context)
        item3.title = "Tesla Model S"
        item3.price = 110000
        item3.details = "Oh man this is a beautiful car. And one day, I willl own it"
        
        ad.saveContext()
    
    }
    
    
}

