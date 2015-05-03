//
//  PullViewController.swift
//  GithubDisplayer
//
//  Created by William Hong Jun Cho on 5/2/15.
//  Copyright (c) 2015 William Hong Jun Cho. All rights reserved.
//

import Foundation
import UIKit

class PullViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var table:UITableView!
    
    var pulls:[GitPull] = [GitPull]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.userInteractionEnabled = false
        
        ContentManager.requestPullData { (list, error) -> Void in
            if error != nil {
                
            }
            
            self.pulls = list
            
            //table not loading correctly, forced to use main queue
            NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                self.table.reloadData()
                self.table.userInteractionEnabled = true
            })
        }
    }
    
    func UIColorFromHex(rgbValue:UInt32, alpha:Double=1.0)->UIColor {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
    }
    
    /*
    Table View
    */
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pulls.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var data = pulls[indexPath.row]
        var cell:PullCell = tableView.dequeueReusableCellWithIdentifier("cell") as! PullCell

        cell.title.text = data.title
        cell.name.text = data.name
        
        cell.avatar.layer.cornerRadius = cell.avatar.frame.size.width / 2
        cell.avatar.layer.borderWidth = 1.0
        cell.avatar.clipsToBounds = true
//        dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
//            if let url = NSURL(string: "") {
//                if let data = NSData(contentsOfURL: url) {
//                    cell.avatar.image = UIImage(data: data)
//                }
//            }
//        })
        
        for sv in cell.labels.subviews {
            sv.removeFromSuperview()
        }
        
        
        println(cell.labels.bounds)
        println(cell.labels.frame)
        var lastPoint = CGPoint(x: 0, y: 0)
        for lbl:GitLabel in data.labels {
            var sv = PullLabel(frame: CGRect(x: lastPoint.x, y: lastPoint.y, width: 70, height: 20))
            sv.redraw(lbl.nome, color: UIColor.clearColor())
            lastPoint.y += 10
            var hexCor = NSString(format:"0x%@", lbl.cor)
//            cell.textLabel?.backgroundColor = UIColorFromHex(hexCor, alpha: 1.0)
            println(hexCor)
            

//            if lastPoint.x + sv.frame.width < cell.labels.frame.width {
//                lastPoint.x += sv.frame.width
//            } else {
//                lastPoint.x = 10
//                lastPoint.y += sv.frame.height
//            }
            
            cell.labels.addSubview(sv)
        }
        return cell
    }
    
    
    
}