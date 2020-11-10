//  ViewController.swift
//  Covid Updates -KE
//  Created by Gerald on 19/10/2020.

import UIKit
import Moya

class ViewController: UIViewController {

    @IBOutlet weak var casesStats: UILabel!
    @IBOutlet weak var recoveredStats: UILabel!
    @IBOutlet weak var deathsStats: UILabel!
    
    //
    private var state: State = .loading {
      didSet {
        switch state {
        case .loading:
          print("App Passed:- Application loaded successfully")
        case .error:
          print("App Failed:- Application failed to load")
        }
      }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Call API Fetch
        downloadcountrydata("kenya")
    }
    
    let provider = MoyaProvider<KEService>()
    
    // Download Kenya data - API Fetch
    func downloadcountrydata(_ country: String) {
        state = .loading
        provider.request(.RequestKE (name: "kenya" )) { [weak self] result in
            guard let self = self else {return}
            switch result {
            case let .success(moyaResponse):
                do {
                    print (try moyaResponse.mapJSON())
                    } catch {
                }
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

extension ViewController {
    enum State {
        case loading
        case error
    }
}
    


