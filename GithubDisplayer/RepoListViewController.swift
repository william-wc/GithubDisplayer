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
    
    @IBOutlet weak var table: UITableView!
    private var repositories:[GitRepo]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ContentManager.getRepoData { (data, error) -> Void in
            println("reloading")
            self.repositories = data
            self.table.reloadData()
        }
    }
    
    /*
        Table View
    */
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories == nil ? 0 : repositories.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var data = repositories[indexPath.row]
        var cell = tableView.dequeueReusableCellWithIdentifier("cell") as! RepoCell
        cell.txtTitle.text = data.full_name
        cell.txtDescription.text = data.repo_description
        return cell
    }
    
    
}