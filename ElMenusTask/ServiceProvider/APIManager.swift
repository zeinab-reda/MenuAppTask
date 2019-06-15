//
//  APIManager.swift
//  ElMenusTask
//
//  Created by Zeinab Reda on 6/15/19.
//  Copyright © 2019 Orange. All rights reserved.
//

import Foundation
import Alamofire
public class APIManager {
    
    static let sharedAPI = APIManager()
    func getElMenus( completion:  @escaping (_:Result<MenuReponse,Error>) -> Void)
    {
        APIClient.performRequest(route: APIRouter.menu, completion: completion)
    }
}
