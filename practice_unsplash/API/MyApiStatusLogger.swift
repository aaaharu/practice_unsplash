//
//  myLogger.swift
//  practice_unsplash
//
//  Created by 김은지 on 2023/05/21.
//

import Foundation
import Alamofire

final class MyApiStatusLogger: EventMonitor {
    
    let queue = DispatchQueue(label: "MyApiStatusLogger")
    
    func requestDidResume(_ request: Request) {
            print(#fileID, #function, #line, "- <# 주석 #>")
        debugPrint(request)
        
    }
    
    func request(_ request: DataRequest, didParseResponse response: DataResponse<Data?, AFError>) {
            print(#fileID, #function, #line, "-  주석 ")
        debugPrint(response)
    }
    
}
