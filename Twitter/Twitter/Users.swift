//
//  Users.swift
//  Twitter
//
//  Created by Nurlybek Mussin on 11.04.18.
//  Copyright © 2018 Nurlybek Mussin. All rights reserved.
//

import Foundation
import FirebaseDatabase

class Users{
    
    private var fullname: String?
    private var username: String?
    private var birthdate: String?
    private var password: String?
    
    init(_ fullname: String, _ username: String, _ birthdate: String, _ password: String) {
        self.fullname = fullname
        self.username = username
        self.birthdate = birthdate
        self.password = password
    }
    
    init(_ snapshot: DataSnapshot) {
        let user = snapshot.value as! NSDictionary
        password = user.value(forKey: "password") as? String
        username = user.value(forKey: "username") as? String
        fullname = user.value(forKey: "fullname") as? String
        birthdate = user.value(forKey: "birthdate") as? String
    }
    var Fullname: String?{
        get{
            return fullname
        }
    }
    var Username: String?{
        get{
            return username
        }
    }
    var Birthdate: String? {
        get{
            return birthdate
        }
    }
    var Password: String? {
        get{
            return password
        }
    }
    func toJSONFormat()-> Any{
        return ["birthdate": birthdate,
                "fullname": fullname,
                "password": password,
                "username": username]
    }
}


