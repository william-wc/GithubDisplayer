//
//  RepoDetailViewController.swift
//  GithubDisplayer
//
//  Created by William Hong Jun Cho on 5/2/15.
//  Copyright (c) 2015 William Hong Jun Cho. All rights reserved.
//

import Foundation
import UIKit

class RepoDetailViewController: UIViewController {
    
    @IBOutlet weak var image:UIImageView!
    @IBOutlet weak var name:UILabel!
    @IBOutlet weak var textDescription:UITextView!
    
    var repository:GitRepo!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        repository = ContentManager.currentRepo
        
        image.layer.cornerRadius = image.frame.size.height / 2
        image.layer.borderWidth = 1.0
        image.clipsToBounds = true
        dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            if let url = NSURL(string: self.repository.owner.avatar_url) {
                if let data = NSData(contentsOfURL: url) {
                    self.image.image = UIImage(data: data)
                }
            }
        })
        
        name.text = repository.full_name
        textDescription.text = repository.repo_description
    }
    
    @IBAction func onBtnPullRequest(sender:UIButton) {
        
    }
}
