//
//  User.swift
//  CallUp
//
//  Created by Utsav Patel on 7/28/15.
//  Copyright (c) 2015 Utsav Patel. All rights reserved.
//

import Foundation

class User{
    // Person class attributes
    // Name , Phone , AltPhone , Email

    // *** In Future *** //
    // Split name into: First Name, Middle Name, Last Name
    // Variable number of phone entries
    // Birthday, Anniversery type date related attributes
    // Connection to FB and other Accounts
    // Photo (Imported from FB)
    // Groups
    
    var name: String
    var phone: String
    var altPhone: String
    var email: String
    
    init(name: String, phone: String, altPhone: String, email: String){
        self.name = name
        self.phone = phone
        self.email = email
        self.altPhone = altPhone
        
    }
    

}