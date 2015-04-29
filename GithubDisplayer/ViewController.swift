//
//  ViewController.swift
//  GithubDisplayer
//
//  Created by William Hong Jun Cho on 4/28/15.
//  Copyright (c) 2015 William Hong Jun Cho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tryConnection()
        
    }
    
    func tryConnection() {
        ConnectionManager.HTTPGetJSON("https://api.github.com/users/mackmobile/repos", callback: { (json, error) -> Void in
            println(json[0]["keys_url"])
            println(json.dynamicType)
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

