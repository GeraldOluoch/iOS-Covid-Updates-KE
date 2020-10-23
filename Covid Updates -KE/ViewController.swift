//
//  ViewController.swift
//  Covid Updates -KE
//
//  Created by Gerald on 19/10/2020.
//

import UIKit
import Moya

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    let provider = MoyaProvider<KEService>()
    
    
    func downloadcountrydata(_ country: String) {
        provider.request(.Request (name: "kenya")) { result in
                
        }
    }
}
    


