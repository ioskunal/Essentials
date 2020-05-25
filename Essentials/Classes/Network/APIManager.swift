
//
//  APIManager.swift
//  Essentials
//
//  Created by Kunal Gupta on 25/05/20.
//  Copyright © 2020 Kunal Gupta. All rights reserved.
//

import Foundation

struct APIManager {
    
    func fetchQuery(_ endpoint: String ,_ dictAPI:[String:Any], completion: @escaping (_ success:Bool, _ dictionary:[String:Any]?) -> ()) {
        
        let url = Endpoints.baseURL + endpoint
        
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "POST" //set http method as POST
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: dictAPI, options: .prettyPrinted) // pass dictionary to nsdata object and set it as request body
        } catch let error {
            print(error.localizedDescription)
        }
        
        let task = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            
            let code = (response as? HTTPURLResponse)?.statusCode
            if Reachability().isConnectedToNetwork() == false || data == nil {
                DispatchQueue.main.async {
                    completion(false,["error":error?.localizedDescription ?? "Can't connect to server"])
                }
                return
            }
            print(code)
            do {
                if let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [String: Any] {
                    DispatchQueue.main.async {
                        if let arrError = json["errors"] as? [Any] {
                            let error = arrError[0] as? [String: Any]
                            let message = (error!["message"] as? String) ?? ""
                            completion(false,["error":message])
                        } else {
                            completion(true,json)
                        }
                    }
                }
            } catch let error {
                completion(false,["error" :error.localizedDescription])
            }
        })
        task.resume()
    }
    
}


