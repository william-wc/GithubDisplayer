//
//  PullRequestViewController.swift
//  GithubDisplayer
//
//  Created by William Hong Jun Cho on 4/29/15.
//  Copyright (c) 2015 William Hong Jun Cho. All rights reserved.
//

import Foundation
import UIKit

class PullRequestViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var repositories:NSMutableArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    
    /*
    Table View
    */
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        
        return cell
    }
    
    
}