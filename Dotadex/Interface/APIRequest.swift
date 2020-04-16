
import Foundation
import Alamofire

protocol APIRequest {
    func parameters() -> [String: Any]?
    func arrayParameter() -> [Any]?
    func endpoint() -> String
    func method() -> HTTPMethod
}

extension APIRequest {
    func parameters() -> [String: Any]? {
        return nil
    }
    
    func arrayParameter() -> [Any]? {
        return nil
    }
}
