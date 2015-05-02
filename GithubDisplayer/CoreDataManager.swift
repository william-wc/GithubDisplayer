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
    
    static func hasGitUser(id:Int) -> Bool {
        var results = getGitUsers(NSPredicate(format: "id == %d", id))
        return results.count > 0
    }
    
    static func getGitUser(id:Int) -> GitUser? {
        var request = getGitUsers(NSPredicate(format: "id == %d", id))
        
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
    
    static func getGitRepos(predicate:NSPredicate?) -> Array<GitRepo> {
        var results = getFetchRequest(Entities.GitRepo, predicate: predicate) as! [GitRepo]
        return results
    }
    
    static func hasGitRepo(id:Int) -> Bool {
        var results = getGitRepos(NSPredicate(format: "id == %d", id))
        return results.count > 0
    }
    
    static func getGitRepo(id:Int) -> GitRepo? {
        var request = getGitRepos(NSPredicate(format: "id == %d", id))
        
        var result:GitRepo?
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
    GitPull
    */
    static func newGitPull() -> GitPull {
        return NSEntityDescription.insertNewObjectForEntityForName(Entities.GitPull, inManagedObjectContext: context) as! GitPull
    }
    
    static func getGitPull(predicate:NSPredicate?) -> Array<GitPull> {
        var results = getFetchRequest(Entities.GitRepo, predicate: predicate) as! [GitPull]
        return results
    }
    
    static func hasGitPull(id:Int) -> Bool {
        var results = getGitPull(NSPredicate(format: "id == %d", id))
        return results.count > 0
    }
    
    static func getGitPull(id:Int) -> GitPull? {
        var request = getGitPull(NSPredicate(format: "id == %d", id))
        
        var result:GitPull?
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
    GitLabel
    */
    static func newGitLabel() -> GitLabel {
        return NSEntityDescription.insertNewObjectForEntityForName(Entities.GitLabel, inManagedObjectContext: context) as! GitLabel
    }
    
    static func getGitLabel(predicate:NSPredicate?) -> Array<GitLabel> {
        var results = getFetchRequest(Entities.GitLabel, predicate: predicate) as! [GitLabel]
        return results
    }
    
    static func hasGitLabel(url:String) -> Bool {
        var results = getGitPull(NSPredicate(format: "url == %@", url))
        return results.count > 0
    }
    
    static func getGitLabel(url:String) -> GitLabel? {
        var request = getGitLabel(NSPredicate(format: "id == %@", url))
        
        var result:GitLabel?
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
        
        for repo in getGitRepos(nil) {
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