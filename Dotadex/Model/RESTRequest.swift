
import Foundation
import Alamofire

let ServerURL = "https://api.opendota.com"

struct StatusCode {
    static let accepted: Int = 202
    static let errorGeneral: Int = 88
    static let unauthorized: Int = 401
    static let errorConflict: Int = 409
}

class RESTRequest: NSObject {
    func execute(request: APIRequest,
                 success:@escaping (_ response: Any) -> Void,
                 failure:@escaping (_ error: Error) -> Void) {
        let requestHeaders = ["Content-Type": "application/json",
                              "Accept": "application/json"]
        let requestURL = ServerURL + request.endpoint()
        let requestMethod = request.method()
        var dataRequest: DataRequest
        
        if let requestParameters = request.arrayParameter() {
            dataRequest = self.dataRequest(requestURL: requestURL,
                                           requestMethod: requestMethod.rawValue,
                                           requestHeaders: requestHeaders,
                                           requestArrayParameter: requestParameters)
        } else {
            dataRequest =  self.dataRequest(requestURL: requestURL,
                                            requestMethod: requestMethod,
                                            requestHeaders: requestHeaders,
                                            requestParameters: request.parameters())
        }
                
        dataRequest.responseJSON() { response in
            switch response.result {
            case .success(let value):
                success(value)
                break

            case .failure(let error):
                failure(error)
                break
            }
        }
    }
    
    func dataRequest(requestURL: String,
                     requestMethod: String,
                     requestHeaders: [String : String],
                     requestArrayParameter: [Any]?) -> DataRequest {
        var urlRequest = URLRequest(url: URL(string: requestURL)!)
        urlRequest.httpMethod = requestMethod
        urlRequest.allHTTPHeaderFields = requestHeaders
        if let parameters = requestArrayParameter {
            urlRequest.httpBody = try! JSONSerialization.data(withJSONObject: parameters)
        }
        
        return Alamofire.request(urlRequest)
    }
    
    func dataRequest(requestURL: String,
                     requestMethod: HTTPMethod,
                     requestHeaders: HTTPHeaders,
                     requestParameters: [String : Any]?) -> DataRequest {
        return Alamofire.request(requestURL,
                                 method: requestMethod,
                                 parameters: requestParameters,
                                 encoding: JSONEncoding.default,
                                 headers: requestHeaders)
    }
}
