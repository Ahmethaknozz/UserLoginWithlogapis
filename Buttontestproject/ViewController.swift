//
//  ViewController.swift
//  Buttontestproject
//
//  Created by ahmet hakan öz on 3.06.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tf1: UITextField!
    @IBOutlet weak var tf2: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func button(_ sender: Any) {
       
        print("-\(tf1.text!),-\(tf2.text!)")
        
        let json: [String: Any] = ["username": tf1.text!,"password":tf2.text!]

        let jsonData = try? JSONSerialization.data(withJSONObject: json)

        let url = URL(string: "http://localhost/login_apis/user_login.php")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        request.httpBody = jsonData

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                print(responseJSON)
                
                print(responseJSON["status"]!)
                let user = responseJSON["user"]!
                
                if responseJSON["status"]! as? String == "1"{
                    print("Başarılı")
                    DispatchQueue.main.async {
                        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "homevc") as? homevc
            
                                            
                        self.navigationController?.pushViewController(vc!, animated: true)
                    }
                }else{
                    print("Başarısız")
                }
                
   
                             
               
            }
        }

        task.resume()
        
    }
    
}
