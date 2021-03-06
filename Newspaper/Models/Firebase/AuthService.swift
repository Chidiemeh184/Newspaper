//
//  AuthService.swift
//  Newspaper
//
//  Created by Chidi Emeh on 10/25/17.
//  Copyright © 2017 Chidi Emeh. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase

/// Calls the Firebase class for Authenticating Users
/// Returns an error for appropriate cases

class AuthService {
    
    
     typealias JSONObject = ( (Codable?, Error?) -> Void  )
    
    /// Signs the user in using the right credentials
    static func signIn(email: String, password: String, onSuccess: @escaping () -> Void, onError:  @escaping (_ errorMessage: String?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
            if error != nil {
                onError(error!.localizedDescription)
                return
            }
            onSuccess()
        })
        
    }
    
    /// Creates a user account using the right credentials
    static func signUp(email: String, password: String, onSuccess: @escaping () -> Void, onError:  @escaping (_ errorMessage: String?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            
            if error != nil {
                onError(error!.localizedDescription)
                return
            }else if user != nil {
                onSuccess()
//                let uid = user?.uid
//                let ref = Database.database().reference()
//                let usersReference = ref.child("users")
//                
//                let newUserReference = usersReference.child(uid!)
//                print(newUserReference)
//                //Branches for User
//                print(newUserReference)
                
            }
            
            
        }
        
    }
    
    /// Logs user out
    static func logout(onSuccess: @escaping () -> Void, onError:  @escaping (_ errorMessage: String?) -> Void) {
        do {
            try Auth.auth().signOut()
            onSuccess()
            
        } catch let logoutError {
            onError(logoutError.localizedDescription)
        }
    }
    
    
    
} // End Class AuthService

