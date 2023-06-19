//
//  HomeViewModel.swift
//  Machine Test
//
//  Created by Akshai K on 16/06/23.
//

import Foundation
typealias UpdateData = (() -> Void)
class HomeViewModel {
    
    let apiService = UserviewModel.shared
    private var home : Basedata?
    
    var updateData : UpdateData = { }
    var numberOfSection : Int { self.home?.homeData?.count ?? 0 }
  
    
    init() {
        self.fetchHomeData()
    }
    
    fileprivate func fetchHomeData() {
        Task.init {
            self.home = await apiService.fetchCategories()
            DispatchQueue.main.async {
                self.updateData()
            }
        }
    }
    
    func numberOfItemInSection(section:Int) -> Int {
        home?.homeData?[section].values?.count ?? 0
    }
    
    func itemFor(indexPath:IndexPath) -> Values? {
         home?.homeData?[indexPath.section].values?[indexPath.item]
    }
    
}
