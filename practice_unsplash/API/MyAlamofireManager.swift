//
//  MyAlamofireManager.swift
//  practice_unsplash
//
//  Created by 김은지 on 2023/05/21.
//

import Foundation
import Alamofire



final class MyAlamofireManager {
    
    // 싱글톤 적용
    static let shared = MyAlamofireManager()
    
    // 인터셉터
    let interceptors = Interceptor(interceptors:[
        BaseInterceptor()
    ])
    
    // 로거 설정
        let monitors = [MyLogger(), MyApiStatusLogger()] as [EventMonitor]
    
    // 세션 설정
    var session: Session
    
    private init() {
        session = Session(interceptor: interceptors, eventMonitors: monitors)
        
        
    }
}
