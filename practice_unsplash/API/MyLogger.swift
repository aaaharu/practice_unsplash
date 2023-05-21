//
//  myLogger.swift
//  practice_unsplash
//
//  Created by 김은지 on 2023/05/21.
//

import Foundation
import Alamofire

final class MyLogger: EventMonitor {
    
    let queue = DispatchQueue(label: "MyLogger")
    
//    func requestDidResume(_ request: Request) {
//            print(#fileID, #function, #line, "- <# 주석 #>")
//        debugPrint(request)
//
//    }
    
    func request<Value>(_ request: DataRequest, didParseResponse response: DataResponse<Value, AFError>) {
            print(#fileID, #function, #line, "-  주석 ")
        debugPrint(response)
    }
    
    func request(_ request: DataRequest, didParseResponse response: DataResponse<Data?, AFError>) {
            print(#fileID, #function, #line, "-  주석 ")
        guard let statusCode = request.response?.statusCode else { return }
        
        print(statusCode)
        debugPrint(response)
    }
    
}
