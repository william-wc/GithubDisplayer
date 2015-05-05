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
    
    func UIColorFromHex(color:String, alpha:Double=1.0)->UIColor {
        var cString:String = color.uppercaseString
        
        var rString = cString.substringToIndex(advance(cString.startIndex, 2))
        var gString = cString.substringWithRange(Range<String.Index>(start:advance(cString.startIndex, 2), end:advance(cString.startIndex, 4)))
        var bString = cString.substringWithRange(Range<String.Index>(start:advance(cString.startIndex, 4), end:advance(cString.startIndex, 6)))
        var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
        
        var scan:NSScanner!
        scan = NSScanner(string: rString); scan.scanHexInt(&r)
        scan = NSScanner(string: gString); scan.scanHexInt(&g)
        scan = NSScanner(string: bString); scan.scanHexInt(&b)
        
        var uic = UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(alpha))
//        println("\(cString) \(rString) \(gString) \(bString)")
//        println("\(r) \(g) \(b)")
        return uic
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
        
        cell.avatar.image = nil
        cell.avatar.layer.borderColor = UIColor.clearColor().CGColor
        cell.avatar.layer.cornerRadius = cell.avatar.frame.size.width / 2
        cell.avatar.layer.borderWidth = 1.0
        cell.avatar.clipsToBounds = true
        dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            if let url = NSURL(string: data.owner!.avatar_url) {
                if let data = NSData(contentsOfURL: url) {
                    dispatch_sync(dispatch_get_main_queue(), { () -> Void in
                        cell.avatar.image = UIImage(data: data)
                    })
                }
            }
        })
        
        for sv in cell.labels.subviews {
            sv.removeFromSuperview()
        }
        
        var lastPoint = CGPoint(x: 0, y: 0)
        for lbl:GitLabel in data.labels {
            var sv = PullLabel(frame: CGRect(x: 0, y: 0, width: 70, height: 20))
            sv.redraw(lbl.nome, color: UIColorFromHex(lbl.cor, alpha: 0.3))
            
            sv.frame.origin = CGPoint(x: lastPoint.x, y: lastPoint.y)
            
//            println(cell.labels.frame)
//            println("\(cell.labels.frame.width) \(lastPoint.x + sv.frame.width + sv.frame.width) \(lastPoint.x + sv.frame.width + sv.frame.width < cell.labels.frame.width)")
            
            if lastPoint.x + sv.frame.width + sv.frame.width < cell.labels.frame.width {
                lastPoint.x += sv.frame.width
            } else {
                lastPoint.x = 0
                lastPoint.y += sv.frame.height
            }
            
            cell.labels.addSubview(sv)
        }
        return cell
    }
    
    
    
}