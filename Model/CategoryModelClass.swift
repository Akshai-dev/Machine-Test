//
//  CategoryModelClass.swift
//  Machine Test
//
//  Created by Akshai K on 16/06/23.
//

struct CatergoryViewModel {
    
    let image : String
    let name : String
    
    init(model:Values?) {
        self.image = model?.image_url ?? ""
        self.name = model?.name ?? ""
    }
}

struct BannerViewModel {
    let image : String
    
    init(model:Values?) {
        self.image = model?.bannerUrl ?? ""
    }
}

struct ProductsViewModel {
    let image : String
    let name : String
    let is_express : Bool
    let orginal_price : String?
    let selling_price : String?
    let offer : String
    
    var isOfferBadgeHidden : Bool {
        offer == "0 % off"
    }
    
    init(model:Values?) {
        self.image = model?.image ?? ""
        self.name = model?.name ?? ""
        self.is_express = model?.isExpress ?? true
        self.offer = "\(model?.offer ?? 0) % off"
        self.orginal_price = (model?.offer ?? 0) == 0 ? "" : model?.actualPrice
        self.selling_price =  (model?.offer ?? 0) == 0 ? model?.actualPrice : model?.offerPrice
    }
    
}

