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
        var url = "https://api.github.com/repos/mackmobile/iDicionario/issues/19"
        ConnectionManager.sendRequest(url, callback: { (str, error) -> Void in
            println(str)
        })
//        ConnectionManager.sendRequestJSON(url, callback: { (json, error) -> Void in
//            println(json)
//        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

