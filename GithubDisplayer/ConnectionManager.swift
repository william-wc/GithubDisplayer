//
//  ConnectionManager.swift
//  GithubDisplayer
//
//  Created by William Hong Jun Cho on 4/28/15.
//  Copyright (c) 2015 William Hong Jun Cho. All rights reserved.
//

import Foundation

public class ConnectionManager {
    
    private static let AUTHENTICATION = "d2lsbGlhbWhqY2hvQGdtYWlsLmNvbTpNeXMzY3IzdFA0c3NXMHJk"
    private static let TIMEOUT_INTERVAL = 40.0
    
    private static var session = NSURLSession.sharedSession()
    private static var active_tasks:Set<NSURLSessionDataTask> = []
    
    /*
    Public
    */
    public static func sendRequest(request: NSMutableURLRequest, callback: (String, String?) -> Void) -> Int {
        var task = session.dataTaskWithRequest(
            request,
            completionHandler: { (data:NSData!, response:NSURLResponse!, error:NSError!) -> Void in
                if error != nil {
                    callback("", error.localizedDescription)
                } else {
                    callback(NSString(data: data, encoding: NSUTF8StringEncoding)! as String, nil)
                }
        })
        task.resume()
        active_tasks.insert(task)
        return task.taskIdentifier
    }
    
    public static func sendRequest(url:String, callback: (String, String?) -> Void) -> Int {
        var request = newRequest(url)
        return sendRequest(request, callback: callback)
    }
    
    public static func sendRequestJSON(url: String, callback: (JSON, String?) -> Void) -> Int {
        var request = newRequest(url)
        request.setValue("application/json" , forHTTPHeaderField: "Accept")
        return sendRequest(request, callback: { (data, error) -> Void in
            if error != nil {
                callback(JSON(""), error)
            } else {
                callback(self.JSONParse(data), nil)
            }
        })
    }
    
    public static func getTask(taskId:Int) -> NSURLSessionDataTask? {
        for task:NSURLSessionDataTask in active_tasks {
            if(task.taskIdentifier == taskId) {
                return task
            }
        }
        return nil
    }
    
    public static func cancelRequest(taskId:Int) {
        var target = getTask(taskId)
        if let task = target {
            switch (task.state) {
                case .Completed:
                    break
                case .Canceling, .Running, .Suspended:
                    fallthrough
                default:
                    task.cancel()
            }
            active_tasks.remove(task)
        }
    }
    
    /*
    Specific
    */
    public static func JSONParse(jsonString:String) -> JSON {
        var e: NSError?
        var data: NSData = jsonString.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)!
        var jsonObj = JSON(NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &e)!)
        
        if e == nil {
            return jsonObj
        }
        
        return nil
    }
    
    
    /*
    Private
    */
    private static func newRequest(url:String) -> NSMutableURLRequest {
        var request = NSMutableURLRequest(URL: NSURL(string: url)!)
        request.setValue("Basic \(AUTHENTICATION)", forHTTPHeaderField: "Authorization")
        return request
    }
    
    
}
