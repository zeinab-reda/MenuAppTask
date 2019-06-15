//
//  APIRouter.swift
//  Networking
//

import Alamofire

enum APIRouter: URLRequestConvertible , URLConvertible {
    
    case menu
    
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
        case .menu :
            return .get
        }
    }
    
    // MARK: - Path
    private var path: String {
        switch self {
        case .menu:
            return "/menu"
        }
    }
    
    // MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
        case .menu:
            return nil
        
        }
    }
    
    private var headers: [String: String]? {
        switch self {
        case .menu :
            return [HTTPHeaderField.contentType.rawValue:ContentType.json.rawValue]
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try K.ProductionServer.baseURL.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.allHTTPHeaderFields = headers
        
        // Parameters
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
                debugPrint("Body Paramters: \(NSString(data: (urlRequest.httpBody)!, encoding: String.Encoding.utf8.rawValue) ?? "")")

            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        
        debugPrint(urlRequest)
        return urlRequest
    }
    
    // MARK: - URLConvertible

    func asURL() throws -> URL {
        return  try K.ProductionServer.baseURL.asURL()
    }
}


