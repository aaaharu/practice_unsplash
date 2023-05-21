//
//  ViewController.swift
//  practice_unsplash
//
//  Created by 김은지 on 2023/05/21.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    
    @IBOutlet weak var searchBarTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onSerachBtnClicked(_ sender: UIButton) {
        print(#fileID, #function, #line, "-  주석")
        
//        let url: String =  API.BASE_URL + "search/photos"
        // 키, 밸류 형식의 딕셔너리
//        let queryParam = ["query" : userInput, "client_id" : API.CLIENT_ID ]

        guard let userInput: String = searchBarTF.text else { return }
    
        
        //        AF.request(url, method: .get, parameters: queryParam).response { response in
        //            debugPrint(response)
        
       
        
        
        // 인터셉트 기능을 추가하여 리퀘스트
        MyAlamofireManager
            .shared
            .session
            .request(MySearchRouter.searchPhotos(term: userInput)).response(completionHandler: {
                response in debugPrint(response)
            })
            .validate()
        
    }
    
    
    
    
    
    
    
    
}


