//
//  ConnectionManager.swift
//  GithubDisplayer
//
//  Created by William Hong Jun Cho on 4/28/15.
//  Copyright (c) 2015 William Hong Jun Cho. All rights reserved.
//

import Foundation

class ConnectionManager {
    
    private static let GITHUB_TOKEN = "2486ddfbf425a2bc43549bf2cc416731a2a3ca82"
    private static let TIMEOUT_INTERVAL = 40.0
    
    
    static func sendRequest(request: NSMutableURLRequest, callback: (String, String?) -> Void) {
        let task = NSURLSession.sharedSession().dataTaskWithRequest(
            request,
            completionHandler: { (data:NSData!, response:NSURLResponse!, error:NSError!) -> Void in
                if error != nil {
                    callback("", error.localizedDescription)
                } else {
                    callback(NSString(data: data, encoding: NSUTF8StringEncoding)! as String,
                        nil)
                }
        })
        task.resume()
    }
    
    static func sendRequest(url:String, callback: (String, String?) -> Void) {
        var request = NSMutableURLRequest(URL: NSURL(string: url)!)
        sendRequest(request, callback: callback)
    }
    
    static func sendRequestJSON(url: String, callback: (Dictionary<String, AnyObject>, String?) -> Void) {
        var request = NSMutableURLRequest(URL: NSURL(string: url)!)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        sendRequest(request,
            callback: { (data:String, error:String?) -> Void in
                if error != nil {
                    callback(Dictionary<String, AnyObject>(), error)
                } else {
                    //var json = JSONParseDict(data)
                    
                }
        })
        
    }
    
    
}
