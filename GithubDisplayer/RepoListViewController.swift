//
//  RepoListViewController.swift
//  GithubDisplayer
//
//  Created by William Hong Jun Cho on 4/29/15.
//  Copyright (c) 2015 William Hong Jun Cho. All rights reserved.
//

import Foundation
import UIKit

class RepoListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var table: UITableView!
    private var repositories:[GitRepo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestData()
    }
    
    func requestData() {
        self.table.userInteractionEnabled = false
        
        ContentManager.requestUserReposData({ (data, error) -> Void in
            self.repositories = data
            
            //table not loading correctly, forced to use main queue
            NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                self.table.reloadData()
                self.table.userInteractionEnabled = true
            })
        })
    }
    
    /*
        Table View
    */
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var data = repositories[indexPath.row]
        var cell = tableView.dequeueReusableCellWithIdentifier("cell") as! RepoCell
        cell.txtTitle.text = data.name
        cell.txtDescription.text = data.repo_description
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        ContentManager.currentRepo = repositories[indexPath.row]
    }
    
}