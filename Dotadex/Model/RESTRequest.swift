
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
        var urlRequest = URLRequest(url: URL(string: requestURL)!)
        urlRequest.httpMethod = requestMethod.rawValue
        urlRequest.allHTTPHeaderFields = requestHeaders
        urlRequest.cachePolicy = NSURLRequest.CachePolicy.returnCacheDataElseLoad
                        
        Alamofire.request(urlRequest).responseJSON() { response in
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
}
