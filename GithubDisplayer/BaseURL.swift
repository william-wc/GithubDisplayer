//
//  BaseURL.swift
//  GithubDisplayer
//
//  Created by William Hong Jun Cho on 4/29/15.
//  Copyright (c) 2015 William Hong Jun Cho. All rights reserved.
//

import Foundation


enum BaseURL: String {
    case Base   = "https://api.github.com/"
    case User   = "https://api.github.com/user/{u}"
    case Repo   = "https://api.github.com/repos/{r}"
    case Pull   = "https://api.github.com/repos/{u}/{r}/pulls"
    case Issues = "https://api.github.com/repos/{u}/{r}/labels"
    case Label  = "https://api.github.com/repos/{u}/{r}/issues"

}

struct UserData {
    
    var user:String = ""
    var repo:String = ""
    var url:BaseURL = BaseURL.Base
    
    init() {
        
    }
    
    init(user:String, repo:String, url:BaseURL) {
        self.user = user
        self.repo = repo
    }
    
    init(url:BaseURL) {
        self.url = url
    }
    
    
    
    func getReplaced() -> String {
        return url.rawValue.stringByReplacingOccurrencesOfString("{u}", withString: user)
                    .stringByReplacingOccurrencesOfString("{r}", withString: repo)
    }
    
}