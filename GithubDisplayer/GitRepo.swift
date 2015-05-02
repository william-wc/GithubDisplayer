//
//  GitRepo.swift
//  GithubDisplayer
//
//  Created by Victor Lisboa on 29/04/15.
//  Copyright (c) 2015 William Hong Jun Cho. All rights reserved.
//

import Foundation
import CoreData

class GitRepo: NSManagedObject {

    @NSManaged var full_name            : String
    @NSManaged var html_url             : String
    @NSManaged var id                   : NSNumber
    @NSManaged var labels_url           : String
    @NSManaged var name                 : String
    @NSManaged var priv                 : NSNumber
    @NSManaged var pulls_url            : String
    @NSManaged var repo_description     : String
    @NSManaged var size                 : NSNumber
    @NSManaged var url                  : String
    @NSManaged var repository           : GitUser

    var owner:GitUser!
    
    func setData(data:JSON) {
        self.full_name        = data["full_name"       ].stringValue
        self.html_url         = data["html_url"        ].stringValue
        self.id               = data["id"              ].intValue
        self.labels_url       = data["labels_url"      ].stringValue
        self.name             = data["name"            ].stringValue
        self.priv             = 0
        self.pulls_url        = data["pulls_url"       ].stringValue
        self.repo_description = data["description"     ].stringValue
        self.size             = data["size"            ].intValue
        self.url              = data["url"             ].stringValue
    }
    
}
