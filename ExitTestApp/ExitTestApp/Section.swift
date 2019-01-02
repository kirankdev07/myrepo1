//
//  Section.swift
//  ExitTestApp
//
//  Created by Kirankumar Bollem on 12/28/18.
//  Copyright © 2018 Kirankumar Bollem. All rights reserved.
//

import Foundation

struct Section {
    var country: String!
    var states: [String]!
    var expanded: Bool!
    
    init (country: String, states: [String], expanded: Bool){
        self.country = country
        self.states  = states
        self.expanded = expanded
    }
    
}
