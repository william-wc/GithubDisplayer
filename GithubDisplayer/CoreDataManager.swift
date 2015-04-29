//
//  CoreDataManager.swift
//  GithubDisplayer
//
//  Created by William Hong Jun Cho on 4/29/15.
//  Copyright (c) 2015 William Hong Jun Cho. All rights reserved.
//

import Foundation
import CoreData
import UIKit

public class CoreDataManager {
    
    private static var context = {
        return (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    }()
    
    static func makeGitUser(json:Dictionary<String, AnyObject>) -> GitUser {
        var user = GitUser(entity: NSEntityDescription.entityForName("GitUser", inManagedObjectContext: context!)!,
            insertIntoManagedObjectContext: context)
        user.setDataJSON(json)
        return user
    }
    
}