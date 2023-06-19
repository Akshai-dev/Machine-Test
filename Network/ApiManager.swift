//
//  Datamanager.swift
//  Machine Test
//
//  Created by Akshai K on 15/06/23.
//

import UIKit


class UserviewModel{
    weak var vc: ViewController?
    
    weak var tableCell: MainTableViewCell?
    
    weak var secondTableCell: SecondTableViewCell?
    
    weak var thirdtableCell: ThirdTableViewCell?
    
    var listOfHomeData : [HomeData]?
    
    func fetchCategories(completion: @escaping () ->()){
      
        let url = URL(string: "https://run.mocky.io/v3/69ad3ec2-f663-453c-868b-513402e515f0")
        let urlReq = URLRequest(url: url!)
        let task = URLSession.shared.dataTask(with: urlReq) {(data,response,error) in
            if let myData = data {
                print("My Data",myData)
                do{
                    let userResponse = try JSONDecoder().decode(Basedata.self, from: data!)
                    self.listOfHomeData = userResponse.homeData!
                    
                    DispatchQueue.main.async {
                        
                        self.vc?.tableViewoutlt.reloadData()
                        self.tableCell?.collOutlt.reloadData()
                        self.secondTableCell?.seconCollOutlt.reloadData()
                        self.thirdtableCell?.thirdCollOutlt.reloadData()
                    }
                    
                    completion()
                }catch{
                    print(error.localizedDescription)
                }
            }
            
        }
        task.resume()
        
      }
    }
      
    
  
