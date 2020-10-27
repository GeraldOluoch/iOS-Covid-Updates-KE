//
//  ViewController.swift
//  Covid Updates -KE
//
//  Created by Gerald on 19/10/2020.
//

import UIKit
import Moya

class ViewController: UIViewController {

    @IBOutlet weak var casesStats: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Call API Fetch
        downloadcountrydata("kenya")
    }
    
    let provider = MoyaProvider<KEService>()
    
    // Download Kenya data - API Fetch
    func downloadcountrydata(_ country: String) {
        provider.request(.RequestKE (name: "kenya" )) { result in
            switch result {
            case .success(let moyaResponse):
                _ = moyaResponse.data // Data, your JSON response is probably in here!
                _ = moyaResponse.statusCode
                    // do something with the response data or statusCode
                    print("Successful Response")
            case let .failure(error):
                    // this means there was a network failure - either the request
                    // wasn't sent (connectivity), or no response was received (server
                    // timed out).  If the server responds with a 4xx or 5xx error, that
                    // will be sent as a ".success"-ful response.
                let alertController = UIAlertController(title: "Covid Stats -KE", message:
                    "Please check your internet!", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
                    self.present(alertController, animated: true, completion: nil)
            }
        }
    }
}
    


