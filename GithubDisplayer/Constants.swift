//
//  BaseURL.swift
//  GithubDisplayer
//
//  Created by William Hong Jun Cho on 4/29/15.
//  Copyright (c) 2015 William Hong Jun Cho. All rights reserved.
//

import Foundation

public struct Entities {
    static let GitUser :String = "GitUser"
    static let GitPull :String = "GitPull"
    static let GitRepo :String = "GitRepo"
    static let GitLabel:String = "GitLabel"
}

enum GitURL: String {
    case Base       = "https://api.github.com/"
    case User       = "https://api.github.com/users/{u}"
    case UserRepos  = "https://api.github.com/users/{u}/repos"
    case Repo       = "https://api.github.com/repos/{r}"
    case Pull       = "https://api.github.com/repos/{u}/{r}/pulls"
    case Issues     = "https://api.github.com/repos/{u}/{r}/issues"
    case Label      = "https://api.github.com/repos/{u}/{r}/labels/{i}"

}

struct UserData {
    
    var user:String     = ""
    var repo:String     = ""
    var issue:Int       = 0
    var gitUrl:GitURL  = GitURL.Base
    
    init() {
        
    }
    
    init(user:String, repo:String, url:GitURL) {
        self.user = user
        self.repo = repo
        self.gitUrl = url
    }
    
    init(url:GitURL) {
        self.gitUrl = url
    }
    
    func getUrl() -> String {
        return self.gitUrl.rawValue.stringByReplacingOccurrencesOfString("{u}", withString: user)
            .stringByReplacingOccurrencesOfString("{r}", withString: repo)
            .stringByReplacingOccurrencesOfString("{i}", withString: String(issue))
    }
    
    func toString() -> String {
        return "user:\"\(user)\", repo:\"\(repo)\", url:\"\(getUrl())\""
    }
    
}