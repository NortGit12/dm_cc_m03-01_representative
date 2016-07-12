//
//  StateListTableViewController.swift
//  Representative
//
//  Created by Jeff Norton on 7/11/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class StateListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return StateController.states.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("stateListCell", forIndexPath: indexPath)

        let state = StateController.states[indexPath.row]
        
        cell.textLabel?.text = state

        return cell
    }
    
    // MARK: - Method(s)

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // How are we getting there?
        if segue.identifier == "viewExistingReps" {
            
            // Where are we going?
            if let stateDetailTableViewController = segue.destinationViewController as? StateDetailTableViewController {
                
                // What do we need to pack?
                if let index = tableView.indexPathForSelectedRow?.row {
                    
                    let state = StateController.states[index]
                    
                    // Did we finish packing?
                    stateDetailTableViewController.state = state
                    
                }
            }
        }
    }
    

}
