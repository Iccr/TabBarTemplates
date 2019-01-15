//
//  DataRequestExtension.swift
//  GMERemittance
//
//  Created by gme_2 on 22/08/2018.
//  Copyright © 2018 Gobal Money Express Co. Ltd. All rights reserved.
//
import Foundation
import Alamofire
import ObjectMapper
import SwiftyJSON

enum AppResponseErrorCode: Int {
    case timeOut = 0
    case failure
    case unknown
    case deleted
}

enum AppResponseOperationStatusCode: String {
    case successfull = "Operation Successfull"
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
                    let error = self.makeError(message: "Response could not be mapped", code: AppResponseErrorCode.unknown.rawValue)
                    //                    let error = self.makeError(message: "Response could not be mapped", code: GMEResponseErrorCode.unknown.rawValue)
                    failure(error)
                }
                    
                else {
                    // while operation like delete reciepient, api only throws status code 204 with no response. for those case always check errorcode to verify if its is error or it is operation successfull message. The api was desighend this way. I am trying to make our occupation more easier. so while doint operations check if response is only statuscode. is so check  the error
                    
                    let error = self.makeError(message: AppResponseOperationStatusCode.successfull.rawValue, code: AppResponseErrorCode.deleted.rawValue)
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
