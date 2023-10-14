//
//  ViewController.swift
//  SainathGetPostAPI
//
//  Created by Sainath Bamen on 22/09/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func onGetTapped(_ sender: UIButton) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let response = response {
                print(response)
            }
            guard let data = data, error == nil else { return }
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                print(json)
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    @IBAction func onPostTapped(_ sender: UIButton) {
        
        let parameters = ["userName": "Bamen-Sainath-Arjun-iq", "tweet": "Hello World!"]
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else { return }
        request.httpBody = httpBody
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let response = response {
                print(response)
            }
            guard let data = data, error == nil else { return }
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
}






