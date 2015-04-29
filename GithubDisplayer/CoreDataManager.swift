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
    
    static func makeGitUser(json:Dictionary<String, AnyObject>) -> GitUser {
        let context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        var user = GitUser(
            entity: NSEntityDescription.entityForName("GitUser", inManagedObjectContext: context!)!,
            insertIntoManagedObjectContext: context!)
        user.setDataJSON(json)
        return user
    }
    
}