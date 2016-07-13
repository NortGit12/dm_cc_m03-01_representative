//
//  StateDetailTableViewController.swift
//  Representative
//
//  Created by Jeff Norton on 7/11/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class StateDetailTableViewController: UITableViewController, CustomTableViewCellDelegate {
    
    // MARK: - Stored Properties
    
    var state: String?
    
    var representatives: [Representative] = []    
    // MARK: - General

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let state = state {
            
            UIApplication.sharedApplication().networkActivityIndicatorVisible = true
            
            RepresentativeController.getRepresentativesByState(state) { (representatives) in
                
                dispatch_async(dispatch_get_main_queue(), {
                    
                    self.representatives = representatives
                    self.tableView.reloadData()
                    UIApplication.sharedApplication().networkActivityIndicatorVisible = false
                    
                })
                
            }
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if state != nil {
            print("Appearing...")
        }
    }
    
    // MARK: - CustomTableViewCellDelegate
    
    func customCellTapped(sender: StateDetailTableViewCell) {
        
        
        
    }
    
    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return representatives.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCellWithIdentifier("stateDetailCell", forIndexPath: indexPath) as? StateDetailTableViewCell else { return UITableViewCell() }
        
        let representative = representatives[indexPath.row]
        
        cell.delegate = self
        cell.updateWithRepresentative(representative)
        
        return cell
    }

}
