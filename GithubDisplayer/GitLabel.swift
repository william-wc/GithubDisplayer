//
//  GitLabel.swift
//  GithubDisplayer
//
//  Created by Victor Lisboa on 29/04/15.
//  Copyright (c) 2015 William Hong Jun Cho. All rights reserved.
//

import Foundation
import CoreData

class GitLabel: NSManagedObject {

    @NSManaged var cor: String
    @NSManaged var nome: String
    @NSManaged var url: String
    @NSManaged var pull: GitPull
    @NSManaged var repo: GitRepo

    func setData(json:JSON) {
        self.cor = json["color"].stringValue
        self.nome = json["name"].stringValue
        self.url = json["url"].stringValue
    }
}
