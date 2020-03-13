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
    let userRef = Database.database().reference().child("users")
    let groupsRef = Database.database().reference().child("groups")
    
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
    func loginUser(email: String, password: String) -> String?{
        var loggedInUser: String?
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if let _error = error {
                print(_error.localizedDescription)
                
            } else{
                loggedInUser = result?.user.uid
                // fetch user from database with the UID and perform segue with USER
            }
            
        }
        return loggedInUser
    }
    func getUser(uid: String) -> User {
        var user: User!
        
        _ = userRef.child(uid).observe(DataEventType.value, with: { (snapshot) in
            let userDict = snapshot.value as?  [String : String] ?? [:]
            user = User(username: userDict["username"]!)
        })
        return user
    }
    // Adds user to realtime db, with authID as userID and selected username.
    func addUserWithUsernameToDatabase(user: User) {
        
        self.ref.child("users").child(user.userID!).setValue(["username":user.username])
    }
    // Adds group to database with it's creator (user)
    func addGroupToDatabase(group: Group, user: User) {
        // Create group in database and add member to group
        guard let key = self.ref.child("groups").childByAutoId().key else {return}
        
        group.groupId = key
        
        let groupUpdates = ["groupname": group.groupName,
                       "members": user.username!]
        self.groupsRef.child(key).setValue(groupUpdates)
        
        // Add group to users grouparray
        let userUpdates = ["groupID":key,
                           "groupname":group.groupName]
        self.userRef.child(user.userID!).child("groups").setValue(userUpdates)
        
    }
    func addMemberToGroup(group: Group, user:User) {
        //group.groupMembers.map({ $0. })
        //self.ref.child("groups").child(group.groupId).child(group.groupName).
    }
    func addTaskToDatabase() {
        
    }
  
    
}
