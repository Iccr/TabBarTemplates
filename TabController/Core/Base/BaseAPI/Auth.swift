//
//  RestApiManager.swift
//  GMERemittance
//
//  Created by Sujal on 12/5/17.
//  Copyright © 2017 Gobal Money Express Co. Ltd. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import ObjectMapper

enum ApiResult {
    case success(JSON)
    case failure(JSON)
    case updateAccessCode()
    case logOutUser()
    case timeOut()
}


enum Server {
    case uat
    case stagging
    case live
}

class Auth {
    
    let manager: SessionManager

    
    static let sharedInstance = Auth()
    
    init() {
        self.manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 150
    }

    func getUUID() -> String {
        
        let uuid = UserDefaults.standard.object(forKey: AppConstants.uuid) as? String
                if uuid != nil {
                    return uuid!
                } else {
                    let uuid = UUID().uuidString
                    UserDefaults.standard.set(uuid, forKey: AppConstants.uuid)
                    return uuid
                }
    }
    
    func getContentHeaderBeforeLogin() -> [String: String] {
        
        return ["Authorization": "Basic " + ("172017F9EC11222E8107142733:QRK2UM0Q" +
            ":" + getUUID()).toBase64(),
                "GME-TOKEN" : "39587YT398@FBQOW8RY3#948R7GB@CNEQW987GF87$TD18$1981..919@@##joghndvberteiru",
                "Content-Type": "application/json"]
    }
    
    func getContentHeaderAfterLogin() -> [String: String] {
        
        let accessCode = UserDefaults.standard.object(forKey: "com.gmeremit.accessCode") as? String ?? ""
        
        return [
            "Authorization": "Bearer " + accessCode,
            "GME-TOKEN" : "39587YT398@FBQOW8RY3#948R7GB@CNEQW987GF87$TD18$1981..919@@##joghndvberteiru",
            "Content-Type": "application/json",
            "clientId":  ""
        ]
    }
    

    
    
    // ccr
    
    //    added failure for delete operation. check if code is 204. if show show successfull message even in error
    func request<T: Mappable>(method: HTTPMethod, url: String, params: [String: Any]?, encoding: ParameterEncoding = JSONEncoding.default, needsAuthorization: Bool = true,  success: @escaping (T) -> (), failure: @escaping (Error) -> ()) {
        if NetworkReachabilityManager()?.isReachable ?? false {
            let header = needsAuthorization ? getContentHeaderAfterLogin() : getContentHeaderBeforeLogin()
            manager.request(
                url,
                method: method,
                parameters: params,
                encoding: encoding,
                headers: header
                ).handle(success: success, failure: failure)
        }else {
            let error = NSError.init(domain: "NETWORK_REACHABILITY_DOMAIN", code: 0, userInfo: [NSLocalizedDescriptionKey : "No Internet connection found.  Check your connection."])
            failure(error)
        }
    }
    
  
    func requestMultipart<T: Mappable>(
        method: HTTPMethod,
        _ URLString: URLConvertible,
        parameters: [String: String]? = nil,
        images: [String: Data],
        encoding: Alamofire.ParameterEncoding = URLEncoding.default,
        needsAuthorization: Bool = true,
        success: @escaping (T)-> Void,
        failure: @escaping (Error) -> ()) {
        
        if NetworkReachabilityManager()?.isReachable == true {
                let headers = needsAuthorization ? getContentHeaderAfterLogin() : getContentHeaderBeforeLogin()
                
                self.manager.upload(
                    multipartFormData: { multipartFormData in
                        if !images.isEmpty {
                            images.forEach({ (data) in
                                multipartFormData.append(data.value, withName: data.key, fileName: data.key + ".jpeg", mimeType: "image/jpeg")
                            })
                            
                        }
                        parameters?.forEach({ (params) in
                            multipartFormData.append(params.value.data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName: params.key)
                        })
                        
                },
                    to: URLString,
                    method: method,
                    headers: headers,
                    encodingCompletion: { encodingResult in
                        switch encodingResult {
                        case .success(let upload, _, _):
                            upload.handle(success: success, failure: failure)
                        case .failure(let encodingError):
                            let error = NSError.init(domain: "NETWORK_REACHABILITY_DOMAIN", code: 0, userInfo: [NSLocalizedDescriptionKey : "No Internet connection found.  Check your connection."])
                            failure(error)
                            
                        }
                }
                )
            
        }else {
            let error = NSError.init(domain: "NETWORK_REACHABILITY_DOMAIN", code: 0, userInfo: [NSLocalizedDescriptionKey : "No Internet connection found.  Check your connection."])
            failure(error)
        }
    }
    // ccr
}
