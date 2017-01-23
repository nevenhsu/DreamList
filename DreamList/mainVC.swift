//
//  ViewController.swift
//  DreamList
//
//  Created by Neven on 22/01/2017.
//  Copyright © 2017 Neven. All rights reserved.
//

import UIKit

class mainVC: UIViewController,UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segment: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }
}

