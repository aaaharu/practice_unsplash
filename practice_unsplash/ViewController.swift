//
//  ViewController.swift
//  practice_unsplash
//
//  Created by 김은지 on 2023/05/21.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func onSerachBtnClicked(_ sender: UIButton) {
            print(#fileID, #function, #line, "-  주석")
        
        let url: String =  "https://api.unsplash.com/search/photos?query=cat&client_id=G1Vlnn-OGktHeRJszyMjAHZDHUKRSU_YhIwOKpDmYpE"
        
        AF.request(url).response { response in
            debugPrint(response)
        }
    }
    
    
}

