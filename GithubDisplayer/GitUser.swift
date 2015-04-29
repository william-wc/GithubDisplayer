//
//  GitUser.swift
//  GithubDisplayer
//
//  Created by William Hong Jun Cho on 4/29/15.
//  Copyright (c) 2015 William Hong Jun Cho. All rights reserved.
//

import Foundation
import CoreData

@objc(GitUser)
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
    
    func setDataJSON(json:Dictionary<String, AnyObject>) {
        self.id                  =  json["id"                 ] as! Int
        self.login               =  json["login"              ] as! String
        self.type                =  json["type"               ] as! String
        self.name                =  json["name"               ] as! String
        self.email               =  json["email"              ] as! String
        self.company             =  json["company"            ] as! String
        self.avatar_url          =  json["avatar_url"         ] as! String
        self.url                 =  json["url"                ] as! String
        self.repos_url           =  json["repos_url"          ] as! String
    }


}
