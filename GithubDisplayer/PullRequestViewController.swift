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
    
    
    @IBOutlet var blur: UIView!
    @IBOutlet var actInd: UIActivityIndicatorView!
    @IBOutlet var msgLbl: UILabel!
    
    
    var repositories: NSMutableArray = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        actInd.hidden=true
        msgLbl.text="Por favor aguarde..."
        
        let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
        dispatch_async(dispatch_get_global_queue(priority, 0), { () -> () in
            dispatch_async(dispatch_get_main_queue(), {
                self.actInd.hidden = false
                self.actInd.startAnimating()
                self.actInd.hidesWhenStopped = true
                self.msgLbl.text = "Logando..."
            })
            sleep(5)
            dispatch_async(dispatch_get_main_queue(), {
                self.msgLbl.text = "Usuário logado com sucesso\nCarregando dados..."
            })
            sleep(5)
            dispatch_async(dispatch_get_main_queue(), {
                self.msgLbl.text = "Dados carregados\nPreparando aplicação..."
            })
            println("FIM da Thread")
            dispatch_async(dispatch_get_main_queue(), {
                self.actInd.stopAnimating()
                self.blur.removeFromSuperview()

            })
        })
            println("FIM")
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
        var cell = tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
//        cell.textLabel!.text = repositories[indexPath.row] as? String
        return cell
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete{
            repositories.removeObjectAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
        
    }
}