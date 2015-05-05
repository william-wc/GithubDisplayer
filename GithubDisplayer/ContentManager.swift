//
//  ContentManager.swift
//  GithubDisplayer
//
//  Created by William Hong Jun Cho on 4/30/15.
//  Copyright (c) 2015 William Hong Jun Cho. All rights reserved.
//

import Foundation
import CoreData

class ContentManager {
    
    static var user : UserData = UserData(user: "mackmobile", repo: "", url: GitURL.Base)
    static var currentUser : GitUser?
    static var currentRepo : GitRepo?
    static var currentRepoList : [GitRepo]?
    static var currentPullList : [GitPull]?
    
    static func requestUserReposData(callback:([GitRepo], String?) -> Void) {
        user.gitUrl = GitURL.UserRepos
    
        ConnectionManager.sendRequestJSON(user.getUrl(), callback: { (json, error) -> Void in
            if error != nil {
                return
            }
            
            //println(json)
            
            var list = [GitRepo]()
            
            for (key:String, repoData:JSON) in json {
                var repoID:Int = repoData["id"].intValue
                var repo:GitRepo!
                if CoreDataManager.hasGitRepo(repoID) {
                    repo = CoreDataManager.getGitRepo(repoID)
                } else {
                    repo = CoreDataManager.newGitRepo()
                    repo.setData(repoData)
                }
                
                var ownerID:Int = repoData["owner"]["id"].intValue
                var owner:GitUser!
                if CoreDataManager.hasGitUser(ownerID) {
                    owner = CoreDataManager.getGitUser(ownerID)!
                } else {
                    owner = CoreDataManager.newGitUser()
                    owner.setDataJSON(repoData["owner"])
                    CoreDataManager.save()
                }
                
                repo.owner = owner
                list.append(repo)
                CoreDataManager.save()
            }
            
            self.currentRepoList = list
            callback(list, error)
        })
    }
    
    static func requestRepoData(callback:(String, String?) -> Void) {
        
    }
    
    static func requestPullData(callback:([GitPull], String?) -> Void) {
        user.repo = currentRepo!.name
        user.gitUrl = GitURL.Issues
//        user.gitUrl = GitURL.Pull
        
        ConnectionManager.sendRequestJSON(user.getUrl(), callback: { (json, error) -> Void in
            if error != nil {
                return
            }
            
            var list = [GitPull]()
            
            for (key:String, jsonData:JSON) in json {
                var pullID:Int = jsonData["id"].intValue
                var pull:GitPull!
                if CoreDataManager.hasGitPull(pullID) {
                    pull = CoreDataManager.getGitPull(pullID)
                } else {
                    pull = CoreDataManager.newGitPull()
                    pull.setData(jsonData)
                }
                
                var ownerID:Int = jsonData["user"]["id"].intValue
                var owner:GitUser!
                if CoreDataManager.hasGitUser(ownerID) {
                    owner = CoreDataManager.getGitUser(ownerID)!
                } else {
                    owner = CoreDataManager.newGitUser()
                    owner.setDataJSON(jsonData["user"])
                    CoreDataManager.save()
                }
                pull.owner = owner
                pull.labels = [GitLabel]()
                for (key1:String, jsonLabel:JSON) in jsonData["labels"] {
                    var labelUrl = jsonData["url"].stringValue
                    var label:GitLabel!
                    if CoreDataManager.hasGitLabel(labelUrl) {
                        label = CoreDataManager.getGitLabel(labelUrl)
                    } else {
                        label = CoreDataManager.newGitLabel()
                        label.setData(jsonLabel)
                    }
                    pull.labels.append(label)
                    CoreDataManager.save()
                }
                
                list.append(pull)
                CoreDataManager.save()
            }
            
            self.currentPullList = list
            
            callback(list, error)
        })
    }
}