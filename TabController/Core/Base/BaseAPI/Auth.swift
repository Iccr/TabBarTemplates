// add auth for facebook and firebase from hiidden


import Foundation
import Alamofire
//import SwiftyJSON
import ObjectMapper

class Auth {
    let manager: SessionManager
    
    init() {
        self.manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 150
    }
    
    func request<T: Mappable>(method: HTTPMethod, url: String, params: [String: Any]?, encoding: ParameterEncoding = JSONEncoding.default, needsAuthorization: Bool = true,  success: @escaping (T) -> (), failure: @escaping (Error) -> ()) {
        if NetworkReachabilityManager()?.isReachable ?? false {
            
            manager.request(url, method: method, parameters: params, encoding: encoding, headers: nil)
            
            manager.request(
                url,
                method: method,
                parameters: params,
                encoding: encoding,
                headers: nil
                ).handle(success: success, failure: failure)
        }else {
            let error = NSError.init(domain: "NETWORK_REACHABILITY_DOMAIN", code: 0, userInfo: [NSLocalizedDescriptionKey : "No Internet connection found.  Check your connection."])
            failure(error)
        }
    }
}


extension DataRequest {
    func handle<T: Mappable>(success: @escaping (T) -> (), failure: @escaping  (Error) -> ()) {
        self.validate().responseJSON { (response) -> Void in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                if let model: T = json.map() {
                    success(model)
                }else if (response.response?.statusCode ?? -1) == 204 {
                    let error = self.makeError(message: "Response could not be mapped", code: GMEResponseErrorCode.unknown.rawValue)
                    //                    let error = self.makeError(message: "Response could not be mapped", code: GMEResponseErrorCode.unknown.rawValue)
                    failure(error)
                }
                    
                else {
                    // while operation like delete reciepient, api only throws status code 204 with no response. for those case always check errorcode to verify if its is error or it is operation successfull message. The api was desighend this way. I am trying to make our occupation more easier. so while doint operations check if response is only statuscode. is so check  the error
                    
                    let error = self.makeError(message: GmeResponseOperationStatusCode.successfull.rawValue, code: GMEResponseErrorCode.deleted.rawValue)
                    failure(error)
                }
            case .failure(let error):
                failure(error)
            }
        }
    }
    
    private func makeError(message: String, code: Int) -> Error {
        let errorInfo: [String: Any]? = [NSLocalizedDescriptionKey: message]
        return NSError.init(domain: "Network", code: code, userInfo: errorInfo)
    }
}
