//
//  BaseInterceptor.swift
//  practice_unsplash
//
//  Created by 김은지 on 2023/05/21.
//

import Foundation
import Alamofire

class BaseInterceptor: RequestInterceptor {
    
    //request가 호출될 때 adpat가 같이 호출, 컴플레션을 꼭 호출해야 함
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
         print(#fileID, #function, #line, "- <# 주석 #>")
        
        var request = urlRequest
        
        // 에러가 났을 때 html 형태가 아니라 json 형태로 받는 설정
        request.addValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json; charset=UTF-8", forHTTPHeaderField: "Accept")
        
        // 공통 파라미터 추가
        var dictionary = [String:String]()
        dictionary.updateValue(API.CLIENT_ID, forKey: "client_id")
        
        do {
            request = try URLEncodedFormParameterEncoder().encode(dictionary, into: request)
        } catch {
            print(error.localizedDescription)
        }
      
        
        completion(.success(request))
        
        
    }
    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
            print(#fileID, #function, #line, "-  주석 ")
        
        // API를 다시 호출하지 않음
        // 벨리데이트라는 설정을 해야 이것이 아마 호출되는데 이번에는 안함
        completion(.doNotRetry)
    }
}
