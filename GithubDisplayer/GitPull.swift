//
//  GitPull.swift
//  GithubDisplayer
//
//  Created by William Hong Jun Cho on 5/2/15.
//  Copyright (c) 2015 William Hong Jun Cho. All rights reserved.
//

import Foundation
import CoreData

class GitPull: NSManagedObject {

    @NSManaged var name: String
    @NSManaged var id: NSNumber
    @NSManaged var title: String
    @NSManaged var label: NSSet
    @NSManaged var repo: GitRepo
    @NSManaged var user: NSSet
    
    var labels:[GitLabel]!
    
    func setData(json:JSON) {
        self.id = json["id"].intValue
        self.title = json["title"].stringValue
        self.name = json["user"]["login"].stringValue
    }

}
