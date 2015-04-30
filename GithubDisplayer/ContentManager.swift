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
    
    static func getRepo() {
        
        var user = UserData(user: "mackmobile", repo: "iDicionario", url: GitURL.UserRepos)
        println(user.toString())
        
        ConnectionManager.sendRequestJSON(user.getUrl(), callback: { (json, error) -> Void in
            
            if error != nil {
                return
            }
            
            println(json)
            
        })
    }
    
}