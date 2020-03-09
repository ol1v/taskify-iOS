//
//  DatabaseHelper.swift
//  taskify
//
//  Created by Oliver Lennartsson on 2020-02-28.
//  Copyright © 2020 Oliver Lennartsson. All rights reserved.
//

import Foundation
import Firebase

class DatabaseHelper: NSObject {
    
    let ref = Database.database().reference()
    
    override init() {
        super.init()
        
    }
    
    func createUser(user: User) {
        
        Auth.auth().createUser(withEmail: (user.email!), password: (user.password!)) { (result, error) in
                   if let _error = error {
                       // ERROR
                       print(_error.localizedDescription )
                   }else{
                       //user registered successfully
                    print("no error")
                    print(result ?? "no result")
                    // add user to database with username
                    user.userID = result?.user.uid
                    
                    self.addUserWithUsernameToDatabase(user: user)
                    // Go to homescreen(userVC) with segue. Send user.
                    // Fix auto-login after successful signUp
                    
                   }
                }
    }
    // Adds user to realtime db, with authID as userID and selected username.
    func addUserWithUsernameToDatabase(user: User) {
        self.ref.child("users").child(user.userID!).setValue(["username":user.username])
    }
  
    
}
