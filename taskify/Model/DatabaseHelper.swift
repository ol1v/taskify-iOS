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
    var user: User!
    var userID = String()
    
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
    func loginUser(email: String, password: String,completion: @escaping (String) -> ()){
        
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            if let _error = error {
                print(_error.localizedDescription)
                
            } else {
                let userWithID = authResult?.user.uid
                
                completion(userWithID!)
                
                    }
            }
        }
    func getUser(uid: String, completion: @escaping (User) -> ()){
        
        userRef.child(uid).observeSingleEvent(of: .value) { (snapshot) in
            let value = snapshot.value as? NSDictionary
            let username = value?["username"] as? String ?? ""
            let userID = uid
            let user = User(username: username, uid: userID)
            completion(user)
            
            print("got user from database: \(username)")
        }
    }
    func returnUser() -> User{
        return self.user
    }

    // Adds user to realtime db, with authID as userID and selected username.
    func addUserWithUsernameToDatabase(user: User) {
        
        self.ref.child("users").child(user.userID!).setValue(["username":user.username,
                                                              "userID":user.userID!])
    }
    
    // Adds group to database with it's creator (user)
    func addGroupToDatabase(group: Group, user: User) {
        // Create group in database and add member to group
        guard let key = self.ref.child("groups").childByAutoId().key else {return}
        
        group.groupId = key
        
        let groupUpdates = ["groupID":key,
                            "groupname": group.groupName]
        
        self.groupsRef.child(key).setValue(groupUpdates)
        self.groupsRef.child(key).child("members").setValue(["member":user.username])
        
        // Add group to users grouparray
        let userUpdates = ["groupID":key,
                           "groupname":group.groupName]
        
        self.userRef.child(user.userID!).child("groups").setValue(userUpdates)
        
    }
    func updateData(user: User) {
        for group in user.usersGroups {
            
            groupsRef.child(group.groupId).observe(.value, with: { snapshot in
                print(snapshot.value as Any)
            })
        }
    }
    
    func addTaskToDatabase(group: Group, task: Task) {
            //Overridar befintliga tasks.. fixa!
            // Skapa toAnyObject() funktion som tar en user/group/task och gör om den till en dictionary..
        //let newTask [String : Any] = ["task":task.basicTask, "completed:":false]
        self.groupsRef.child(group.groupId).child("tasks").setValue(["task":task.basicTask!])
    }
    
    func getGroupFromDatabase(group: Group) {
        self.ref.child("groups").child(group.groupId).observe(DataEventType.value) { (snapshot) in
            let groupDict = snapshot.value as? [String : String] ?? [:]
            
        }
    }
}
