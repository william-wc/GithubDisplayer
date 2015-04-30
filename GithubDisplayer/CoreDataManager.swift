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
    
    public static let context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext!
    
    /*
    Base
    */
    private static func getFetchRequest(entity:String, predicate:NSPredicate?) -> Array<NSManagedObject> {
        let request = NSFetchRequest(entityName: entity)
        request.predicate = predicate
        
        var error:NSError?
        var objects = context.executeFetchRequest(request, error: &error)
        if let results = objects as? [NSManagedObject] {
            return results
        } else {
            println("Fetch error: \(error), \(error!.userInfo)")
        }
        return [NSManagedObject]()
    }
    
    
    /*
    GitUser
    */
    static func newGitUser() -> GitUser {
        return NSEntityDescription.insertNewObjectForEntityForName(Entities.GitUser, inManagedObjectContext: context) as! GitUser
    }
    
    static func getGitUsers(predicate:NSPredicate?) -> Array<GitUser> {
        var results = getFetchRequest(Entities.GitUser, predicate: predicate) as! [GitUser]
        return results
    }
    
    static func getGitUser(id:Int) -> GitUser? {
        var request = getGitUsers(NSPredicate(format: "id == %@", String(id)))
        
        var result:GitUser?
        if request.count == 1 {
            result = request[0]
        } else if request.count > 0 {
            //todo
        } else {
            //todo
        }
        return result
    }
    
    /*
    GitRepo
    */
    static func newGitRepo() -> GitRepo {
        return NSEntityDescription.insertNewObjectForEntityForName(Entities.GitRepo, inManagedObjectContext: context) as! GitRepo
    }
    
    static func getGitRepo(predicate:NSPredicate?) -> Array<GitRepo> {
        var results = getFetchRequest(Entities.GitRepo, predicate: predicate) as! [GitRepo]
        return results
    }
    
    /*
    GitPull
    */
    static func newGitPull() -> GitPull {
        return NSEntityDescription.insertNewObjectForEntityForName(Entities.GitPull, inManagedObjectContext: context) as! GitPull
    }
    
    static func getGitPull(predicate:NSPredicate?) -> Array<GitPull> {
        var results = getFetchRequest(Entities.GitRepo, predicate: predicate) as! [GitPull]
        return results
    }
    
    /*
    GitLabel
    */
    static func newGitLabel() -> GitLabel {
        return NSEntityDescription.insertNewObjectForEntityForName(Entities.GitLabel, inManagedObjectContext: context) as! GitLabel
    }
    
    static func getGitLabel(predicate:NSPredicate?) -> Array<GitLabel> {
        var results = getFetchRequest(Entities.GitLabel, predicate: predicate) as! [GitLabel]
        return results
    }
    
    /*
    Context Management
    */
    static func save() {
        var error: NSError?
        context.save(&error)
        if error != nil {
            println("Save error: \(error), \(error!.userInfo)")
        }
    }
    
    static func removeAll() {
        for user in getGitUsers(nil) {
            context.deleteObject(user)
        }
        
        for repo in getGitRepo(nil) {
            context.deleteObject(repo)
        }
        
        for pull in getGitPull(nil) {
            context.deleteObject(pull)
        }
        
        for label in getGitLabel(nil) {
            context.deleteObject(label)
        }
        
        save()
    }
    
}