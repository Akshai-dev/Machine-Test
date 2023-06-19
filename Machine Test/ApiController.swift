//
//  Api COntroller.swift
//  Machine Test
//
//  Created by Akshai K on 15/06/23.
//

import UIKit

weak var vc : ViewController?
class UserviewModel{
    
    var homeData = [HomeData]()
    func apiManager(){
        let url = URL(string: "https://run.mocky.io/v3/69ad3ec2-f663-453c-868b-513402e515f0")
        let urlReq = URLRequest(url: url!)
        let task = URLSession.shared.dataTask(with: urlReq) {(data,response,error) in
            if let myData = data {
                print("My Data",myData)
                do{
                    let userResponse = try JSONDecoder().decode([HomeData].self, from: data!)
                    print("Response",userResponse)
                }catch{
                    print(error.localizedDescription)
                }
            }
            
        }
        task.resume()
    }
}
