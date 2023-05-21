//
//  MySearchLouter.swift
//  practice_unsplash
//
//  Created by 김은지 on 2023/05/21.
//

import Foundation
import Alamofire


// Routing Requests
// 검색 관련 API

enum MySearchRouter: URLRequestConvertible {
    case searchPhotos(term: String)
    case searchUsers(term: String)
    
    var baseURL: URL {
        return URL(string: API.BASE_URL + "search/")!
    }
    
    var method: HTTPMethod {
        // 분기 처리 해서 HttpMethod를 설정할 수 있음
        
        switch self {
        case .searchUsers, .searchPhotos:
            return .get
        }
        
        
        //        switch self {
        //        case .searchPhotos: return .get
        //        case .searchUsers: return .put
        //        }
        
    }
    
    // endPoint
    var path: String {
        switch self {
        case .searchPhotos:
            return "photos/"
        case .searchUsers:
            return "users/"
        }
    }
    
    
    // 실제로 api를 호출했을 때 발동하는 부분
    // throws문은 try만 하면 됨. 에러 처리는 밖으로 빼줌
    func asURLRequest() throws -> URLRequest {
        print(#fileID, #function, #line, "- <# 주석 #>")
        
        // 최종 Url
        let url = baseURL.appendingPathComponent(path)
        
        print(#fileID, #function, #line, "- \(url)")
        
        var request = URLRequest(url: url)
        request.method = method
        
        
        var parameters: [String: String] {
            switch self {
            case let .searchPhotos(term), let .searchUsers(term):
                return ["query": term]
            }
            
        }
        
        //        switch self {
        //        case let .get(parameters):
        //            request = try URLEncodedFormParameterEncoder().encode(parameters, into: request)
        //        case let .post(parameters):
        //            request = try JSONParameterEncoder().encode(parameters, into: request)
        //        }
        
        request = try URLEncodedFormParameterEncoder().encode(parameters, into: request)
        
        return request
    }
}
