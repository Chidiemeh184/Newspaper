//
//  UserApi.swift
//  Newspaper
//
//  Created by Chidi Emeh on 11/22/17.
//  Copyright © 2017 Chidi Emeh. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth

/// The current user or users on
/// the database branch

class UserApi {
    
    /// Users branch on database node
   static var REF_USERS = Database.database().reference().child("users")
    
    /// Gets the current user or nil
    var CURRENT_USER: User? {
        if let currentUser = Auth.auth().currentUser {
            return currentUser
        }
        return nil
    }
    
    typealias currentUserREF = ( (DatabaseReference?) -> Void  )
    
    /// The current User Branch
    static var REF_CURRENT_USER: DatabaseReference? {
        guard let currentUser = Auth.auth().currentUser else {
            return nil
        }
        return REF_USERS.child(currentUser.uid)
    }

    var handle = Auth.auth().addStateDidChangeListener() { (auth, user) in
        if user != nil {
        }
    }
    
    deinit {
         Auth.auth().removeStateDidChangeListener(self.handle)
    }
    
//    /// Checks and returns the current User
//    func getCurrentUser(_ completion : @escaping currentUserREF) {
//        Auth.auth().addStateDidChangeListener { (Auth, User) in
//            guard let user = User else {
//                return
//            }
//            completion(self.REF_USERS.child(user.uid))
//        }
//
//    }
//
    
    
}// End class UserApi
