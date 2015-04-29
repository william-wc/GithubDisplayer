//
//  GitUser.swift
//  GithubDisplayer
//
//  Created by William Hong Jun Cho on 4/29/15.
//  Copyright (c) 2015 William Hong Jun Cho. All rights reserved.
//

import Foundation
import CoreData

class GitUser: NSManagedObject {

    @NSManaged var updated_at: String
    @NSManaged var created_at: String
    @NSManaged var received_events_url: String
    @NSManaged var events_url: String
    @NSManaged var repos_url: String
    @NSManaged var organizations_url: String
    @NSManaged var subscritions_url: String
    @NSManaged var starred_url: String
    @NSManaged var gists_url: String
    @NSManaged var following_url: String
    @NSManaged var followers_url: String
    @NSManaged var html_url: String
    @NSManaged var url: String
    @NSManaged var avatar_url: String
    @NSManaged var following: NSNumber
    @NSManaged var followers: NSNumber
    @NSManaged var public_gists: NSNumber
    @NSManaged var public_repos: NSNumber
    @NSManaged var bio: String
    @NSManaged var hireable: NSNumber
    @NSManaged var location: String
    @NSManaged var blog: String
    @NSManaged var site_admin: NSNumber
    @NSManaged var gravatar_id: String
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
        self.gravatar_id         =  json["gravatar_id"        ] as! String
        self.site_admin          =  json["site_admin"         ] as! Bool
        self.blog                =  json["blog"               ] as! String
        self.location            =  json["location"           ] as! String
        self.hireable            =  json["hireable"           ] as! Bool
        self.bio                 =  json["bio"                ] as! String
        self.public_repos        =  json["public_repos"       ] as! Int
        self.public_gists        =  json["public_gists"       ] as! Int
        self.followers           =  json["followers"          ] as! Int
        self.following           =  json["following"          ] as! Int
        self.avatar_url          =  json["avatar_url"         ] as! String
        self.url                 =  json["url"                ] as! String
        self.html_url            =  json["html_url"           ] as! String
        self.followers_url       =  json["followers_url"      ] as! String
        self.following_url       =  json["following_url"      ] as! String
        self.gists_url           =  json["gists_url"          ] as! String
        self.starred_url         =  json["starred_url"        ] as! String
        self.organizations_url   =  json["organizations_url"  ] as! String
        self.repos_url           =  json["repos_url"          ] as! String
        self.events_url          =  json["events_url"         ] as! String
        self.received_events_url =  json["received_events_url"] as! String
        self.created_at          =  json["created_at"         ] as! String
        self.updated_at          =  json["updated_at"         ] as! String
    }


}
