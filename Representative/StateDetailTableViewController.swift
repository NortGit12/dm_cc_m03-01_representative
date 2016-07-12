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
        
        if state != nil {
            
            UIApplication.sharedApplication().networkActivityIndicatorVisible = true
            
            RepresentativeController.getRepresentativesByState("UT") { (representatives) in
                
                //                let repDetailsForDisplay = representatives.map{ "\($0.name)\n\tParty: \($0.party)\n\tState: \($0.state)\n\tDistrict: \($0.district)\n\tPhone: \($0.phone)\n\tOffice: \($0.office)\n\tLink: \($0.link)" }
                //
                //                var displayText = ""
                //                var counter = 0
                //                for repDetail in repDetailsForDisplay {
                //
                //                    if counter > 0 {
                //                        displayText += "\n"
                //                    }
                //
                //                    displayText += repDetail
                //
                //                    counter += 1
                //                }
                
                dispatch_async(dispatch_get_main_queue(), {
                    
                    UIApplication.sharedApplication().networkActivityIndicatorVisible = false
                    self.representatives = representatives
                    self.tableView.reloadData()
                    
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
