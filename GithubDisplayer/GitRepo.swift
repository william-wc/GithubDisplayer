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

    @NSManaged var full_name: String
    @NSManaged var html_url: String
    @NSManaged var id: NSNumber
    @NSManaged var labels_url: String
    @NSManaged var name: String
    @NSManaged var owner: NSData
    @NSManaged var priv: NSNumber
    @NSManaged var pulls_url: String
    @NSManaged var repo_description: String
    @NSManaged var size: NSNumber
    @NSManaged var url: String
    @NSManaged var repository: GitUser

}
