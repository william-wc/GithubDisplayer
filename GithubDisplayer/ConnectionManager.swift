//
//  ConnectionManager.swift
//  GithubDisplayer
//
//  Created by William Hong Jun Cho on 4/28/15.
//  Copyright (c) 2015 William Hong Jun Cho. All rights reserved.
//

import Foundation

public class ConnectionManager {
    
    
    private static let TIMEOUT_INTERVAL = 40.0
    
    
    static func sendRequest(request: NSMutableURLRequest, callback: (String, String?) -> Void) {
        let task = NSURLSession.sharedSession().dataTaskWithRequest(
            request,
            completionHandler: { (data:NSData!, response:NSURLResponse!, error:NSError!) -> Void in
                if error != nil {
                    callback("", error.localizedDescription)
                } else {
                    callback(NSString(data: data, encoding: NSUTF8StringEncoding)! as String, nil)
                }
        })
        task.resume()
    }
    
    static func sendRequest(url:String, callback: (String, String?) -> Void) {
        var request = NSMutableURLRequest(URL: NSURL(string: url)!)
        sendRequest(request, callback: callback)
    }
    

    
    static func JSONParseDict(jsonString:String) -> Dictionary<String, AnyObject> {
        var e: NSError?
        var data: NSData = jsonString.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)!
        var jsonObj = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &e) as! Dictionary<String, AnyObject>
        
        if e != nil {
            return Dictionary<String, AnyObject>()
        } else {
            return jsonObj
        }
    }
    
    static func HTTPGetJSON(url: String, callback: (Dictionary<String, AnyObject>, String?) -> Void) {
        var authentication = "d2lsbGlhbWhqY2hvQGdtYWlsLmNvbTpNeXMzY3IzdFA0c3NXMHJk" //("user:pass".dataUsingEncoding(NSUTF8StringEncoding))!.base64EncodedStringWithOptions(nil)

        var request = NSMutableURLRequest(URL: NSURL(string: url)!)
        request.setValue("Basic \(authentication)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json" , forHTTPHeaderField: "Accept")
        sendRequest(request, callback: { (data, error) -> Void in
            if error != nil {
                callback(Dictionary<String, AnyObject>(), error)
            } else {
                var jsonObj = self.JSONParseDict(data)
                callback(jsonObj, nil)
            }
        })
    }
    
    
}
