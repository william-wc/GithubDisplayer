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
    
    @IBOutlet weak var blur:BlockView!
    
    var repository:GitRepo!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.repository = ContentManager.currentRepo
        
        hideBlur()
    }
    
    func showBlur() {
        self.view.addSubview(blur)
        
        blur.label.text = "Por favor aguarde..."
        
        let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
        dispatch_async(dispatch_get_global_queue(priority, 0), { () -> () in
            dispatch_async(dispatch_get_main_queue(), {
                self.blur.wheel.hidden = false
                self.blur.wheel.startAnimating()
                self.blur.wheel.hidesWhenStopped = true
                self.blur.label.text = "Logando..."
            })
            sleep(5)
            dispatch_async(dispatch_get_main_queue(), {
                self.blur.label.text = "Usuário logado com sucesso\nCarregando dados..."
            })
            sleep(5)
            dispatch_async(dispatch_get_main_queue(), {
                self.blur.label.text = "Dados carregados\nPreparando aplicação..."
            })
            println("FIM da Thread")
            dispatch_async(dispatch_get_main_queue(), {
                self.blur.wheel.stopAnimating()
                self.blur.removeFromSuperview()
                
            })
            
            self.hideBlur()
        })
    }
    
    func hideBlur() {
        blur.removeFromSuperview()
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
        var cell = tableView.dequeueReusableCellWithIdentifier("cell") as! PullRequestCell
//        cell.textLabel!.text = repositories[indexPath.row] as? String
        return cell
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete{
            //repositories.removeObjectAtIndex(indexPath.row)
            //tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
        
    }
}