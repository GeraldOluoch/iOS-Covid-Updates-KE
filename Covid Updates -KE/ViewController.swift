//  ViewController.swift
//  Covid Updates -KE
//  Created by Gerald on 19/10/2020.

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var casesStats: UILabel!
    @IBOutlet weak var recoveredStats: UILabel!
    @IBOutlet weak var deathsStats: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Call API Fetch
        let urlString = "https://covid-19-data.p.rapidapi.com/country?name=kenya"
        let url = URL(string: urlString)
        
        // Create URL Request
        var request = URLRequest (url: url!)
        
        // Specify HTTP Method to use
        request.httpMethod = "GET"
        
        // Set HTTP Request Header
        request.addValue("covid-19-data.p.rapidapi.com", forHTTPHeaderField: "x-rapidapi-host")
        request.addValue("3bee4b7e02msh0cf90a5b2a0ca73p15204cjsn43ca8fe36992", forHTTPHeaderField: "x-rapidapi-key")
        
        guard url != nil else {
            return
        }
        
        // Send HTTP Request
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            
        // Read HTTP Response Status code
        if let response = response as? HTTPURLResponse {
            print("Response HTTP Status code: \(response.statusCode)")
        }
               
        // Convert HTTP Response Data to a simple String
        if let data = data, let dataString = String(data: data, encoding: .utf8) {
            print("Response data string:\n \(dataString) \n")
        }
            
            //check for errors
            if error == nil && data != nil {
                
            //Parse JSON
                do {
                    if  let dataByName = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [[String:Any]] {
                        for jsonDictionary in dataByName {
                            // Print the Kenya API
                            print(jsonDictionary["country"]!)
                            print(jsonDictionary["code"]!)
                            print(jsonDictionary["confirmed"]!)
                            print(jsonDictionary["recovered"]!)
                            print(jsonDictionary["critical"]!)
                            print(jsonDictionary["deaths"]!)
                            
                            let numberFormatter = NumberFormatter()
                                numberFormatter.numberStyle = .decimal

                    DispatchQueue.main.async {
                        if let value = jsonDictionary["confirmed"] as? NSNumber {
                            self.casesStats.text = value.stringValue
                        }
                        if let value = jsonDictionary["recovered"] as? NSNumber {
                            self.recoveredStats.text = value.stringValue
                        }
                        if let value = jsonDictionary["deaths"] as? NSNumber {
                            self.deathsStats.text = value.stringValue
                        }
                    }
                }
            }
        }catch {
                    print("Error in JSON parsing")
                }
            }
        }
        // Make the API call
        dataTask.resume()
    }
}
