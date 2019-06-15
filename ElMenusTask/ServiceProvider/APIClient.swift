//
//  APIClient.swift
//  Networking
//

import Alamofire


class APIClient {
    
    @discardableResult
    static func performRequest<T:Decodable>(route:APIRouter, decoder: JSONDecoder = JSONDecoder(), completion:@escaping (Result<T,Error>)->Void) -> DataRequest {
        
        return AF.request(route)
            .responseDecodable (decoder: decoder){ (response: DataResponse<T>) in
                
                debugPrint(response)
                completion(response.result)
        }
    }
    
}

