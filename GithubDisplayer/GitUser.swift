//
//  GitUser.swift
//  GithubDisplayer
//
//  Created by William Hong Jun Cho on 4/29/15.
//  Copyright (c) 2015 William Hong Jun Cho. All rights reserved.
//

import Foundation
import CoreData

//@objc(GitUser)
class GitUser: NSManagedObject {

    @NSManaged var repos_url: String
    @NSManaged var html_url: String
    @NSManaged var url: String
    @NSManaged var avatar_url: String
    @NSManaged var company: String
    @NSManaged var email: String
    @NSManaged var name: String
    @NSManaged var type: String
    @NSManaged var login: String
    @NSManaged var id: NSNumber
    
    func setDataJSON(json:JSON) {
        self.repos_url  = json["repos_url" ].stringValue
        self.html_url   = json["html_url"  ].stringValue
        self.url        = json["url"       ].stringValue
        self.avatar_url = json["avatar_url"].stringValue
        self.company    = json["company"   ].stringValue
        self.email      = json["email"     ].stringValue
        self.name       = json["name"      ].stringValue
        self.type       = json["type"      ].stringValue
        self.login      = json["login"     ].stringValue
        self.id         = json["id"        ].intValue
    }
}
