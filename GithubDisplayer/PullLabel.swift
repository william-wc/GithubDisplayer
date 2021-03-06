//
//  PullLabel.swift
//  GithubDisplayer
//
//  Created by William Hong Jun Cho on 5/2/15.
//  Copyright (c) 2015 William Hong Jun Cho. All rights reserved.
//

import Foundation
import UIKit

class PullLabel: UIView {
    
    var label:UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        label = UILabel(frame: CGRect(origin: CGPoint.zeroPoint, size: frame.size))
        label.font = UIFont(name: "Helvetica", size: CGFloat(8.0))
        label.textAlignment = NSTextAlignment.Center
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.ByWordWrapping        
        self.addSubview(label)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func redraw(text:String, color:UIColor) {
        label.text = text
        self.backgroundColor = color
    }
    
}