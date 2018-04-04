//    //
////  Authenticator.swift
////  Sipradi
////
////  Created by shishir sapkota on 6/7/17.
////  Copyright © 2017 Ekbana. All rights reserved.
////
//
//import Foundation
//import FBSDKLoginKit
//import GoogleSignIn
//import FirebaseAuth
//
//protocol AuthenticatorDelegate {
//    func didAuthenticateWithUser(provider: Provider?, user: GIDGoogleUser, error: Error)
//}
//
//// TODO: send facebook token via delegate too
//class SocialAuthenticator: NSObject {
//
//    typealias SuccessWithToken = (_ token: String) -> ()
//    typealias Failure = (_ error: Error) -> ()
//
//    //    static let sharedInstance = Authenticator()
//    var delegate: AuthenticatorDelegate?
//
//    fileprivate var success: SuccessWithToken?
//    fileprivate var failure: Failure?
//
//    func authenticateWith(provider: Provider, success: @escaping SuccessWithToken, failure: @escaping Failure) {
//        switch provider {
//        case Provider.facebook:
//            let loginManager = FBSDKLoginManager()
//            loginManager.logOut()
//            loginManager.logIn(withReadPermissions: ["email"], from: nil, handler: { (result: FBSDKLoginManagerLoginResult?, error: Error?) in
//                if let result = result?.isCancelled, result {
//                    failure(NSError.init(domain: "FBCancelled", code: 0, userInfo: [NSLocalizedDescriptionKey : "Login through facebook aborted."]))
//                    return
//                }
//                if let error = error {
//                    failure(error)
//                    return
//                }
//
//                if let token = result?.token.tokenString {
//                    success(token)
//                }
//
//            })
//        case Provider.google:
//            self.success = success
//            self.failure = failure
//            GIDSignIn.sharedInstance().signOut()
//            GIDSignIn.sharedInstance().delegate = self
//            GIDSignIn.sharedInstance().signIn()
//            break
//        default:
//            break
//        }
//    }
//}
//
//extension SocialAuthenticator: GIDSignInDelegate {
//    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
//        if let error = error {
//            failure?(error)
//            return
//        }
//
//        // do firebase login with credential
//        guard let authentication = user.authentication else { return }
//        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
//                                                       accessToken: authentication.accessToken)
//        FirebaseAuth.Auth.auth().signIn(with: credential) { (user, error) in
//            if let error = error {
//                self.failure?(error)
//                return
//            }
//            // get user token
//            user?.getIDToken(completion: { (token, error) in
//                if let error = error {
//                    self.failure?(error)
//                    return
//                }
//                self.success?(token ?? "")
//            })
//        }
//    }
//
//    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
//        failure?(error)
//    }
//}

