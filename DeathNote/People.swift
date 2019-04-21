//
//  People.swift
//  DeathNote
//
//  Created by Liudmyla POHRIBNIAK on 4/04/19.
//  Copyright © 2019 Liudmyla POHRIBNIAK. All rights reserved.
//

import Foundation

class Person {
    var name: String
    var description: String
    var date: Date
    
    init? (_ name: String, _ description: String, _ date :Date )
    {
        self.name = name
        self.description = description
        self.date = date
    }
    
}
