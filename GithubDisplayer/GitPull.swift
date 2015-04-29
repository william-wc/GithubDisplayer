//
//  GitPull.swift
//  GithubDisplayer
//
//  Created by Victor Lisboa on 29/04/15.
//  Copyright (c) 2015 William Hong Jun Cho. All rights reserved.
//

import Foundation
import CoreData

class GitPull: NSManagedObject {

    @NSManaged var nome: String
    @NSManaged var numero: NSNumber
    @NSManaged var repositorio: String
    @NSManaged var user: NSSet
    @NSManaged var label: NSSet
    @NSManaged var repo: GitRepo

}
