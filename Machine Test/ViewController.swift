//
//  ViewController.swift
//  Machine Test
//
//  Created by Akshai K on 15/06/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    weak var secondTable: SecondTableViewCell?
    weak var thirdtable: ThirdTableViewCell?
    

    var userModel  = UserviewModel()

    var finalData:[HomeData] = []
    
    @IBOutlet weak var tableViewoutlt: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        valueTypes()
        
        userModel.vc = self
        
        finalData = self.userModel.listOfHomeData ?? []
}
   
    func valueTypes() {
        
        userModel.fetchCategories {
            
            self.finalData = self.userModel.listOfHomeData ?? []
            
            print(self.finalData[1].values?.count as Any)
            
        }
     
        
    }
    
    
}
extension ViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return finalData.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "main", for: indexPath) as! MainTableViewCell
            cell.finalData = self.finalData
            return cell
        }else if indexPath.row == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "second", for: indexPath) as! SecondTableViewCell
            cell.SecondFinalData = self.finalData
            return cell
        }else if indexPath.row == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: "third", for: indexPath) as! ThirdTableViewCell
            cell.thirdFinalData = self.finalData
            return cell
        }else{
            return UITableViewCell()
        }
        
        
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 100
        }else if indexPath.row == 1{
            return 200
        }else if indexPath.row == 2{
            return 350
        }else{
            return 0
        }
        
    }
    
   
}
        
 
