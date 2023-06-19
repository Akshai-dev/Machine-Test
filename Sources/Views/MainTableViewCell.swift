//
//  MainTableViewCell.swift
//  Machine Test
//
//  Created by Akshai K on 18/06/23.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var collOutlt: UICollectionView!
    
    var userModel  = UserviewModel()
    
    var finalData:[HomeData] = []
    
    weak var vc: ViewController?
    
    weak var mainTable: MainTableViewCell?
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        collOutlt.dataSource = self
        
        collOutlt.delegate = self
        
        collOutlt.reloadData()
        
       
        
    }
    
   override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
extension MainTableViewCell: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CatColl", for: indexPath) as! CategoryCollCell
                        cell.lblOutlt.text = finalData[0].values![indexPath.row].name
                        let imageUrl = URL(string: (finalData[0].values![indexPath.row].image_url)!)
                        let imgData = try? Data(contentsOf: imageUrl!)
                        cell.imgOutlt.image = UIImage(data: imgData!)
           
                        return cell
       
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return finalData[0].values!.count
    }
    
        
        
       
    }

///------------Points to remember-------------------------
//let section = vc?.tableViewoutlt.tag
//
//        if section == 0{
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CatColl", for: indexPath) as! CategoryCollCell
//            cell.lblOutlt.text = finalData[0].values![indexPath.row].name
//            let imageUrl = URL(string: (finalData[0].values![indexPath.row].image_url)!)
//            let imgData = try? Data(contentsOf: imageUrl!)
//            cell.imgOutlt.image = UIImage(data: imgData!)
//            return cell
//        }else if section == 1{
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "banner", for: indexPath) as! BannerCollCell
//            let imageUrl = URL(string: (finalData[1].values![indexPath.row].banner_url)!)
//            let imgData = try? Data(contentsOf: imageUrl!)
//            cell.bannerImgOutlt.image = UIImage(data: imgData!)
//            return cell
//        }else if section == 2{
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "product", for: indexPath) as! ProductCollCell
//            let imageUrl = URL(string: (finalData[2].values![indexPath.row].image)!)
//            let imgData = try? Data(contentsOf: imageUrl!)
//            cell.imgOutlt.image = UIImage(data: imgData!)
//            cell.firstPrice.text = finalData[2].values![indexPath.row].actualPrice
//            cell.secondPrice.text = finalData[2].values![indexPath.row].offerPrice
//            cell.descriptionOutlt.text = finalData[2].values![indexPath.row].name
//            return cell
//        }else{
//            return UICollectionViewCell()
//        }
//
//    }

////Second Method
//let section = finalData[indexPath.section].type
//
//        switch section {
//
//        case "category" :
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CatColl", for: indexPath) as! CategoryCollCell
//            cell.lblOutlt.text = finalData[0].values![indexPath.row].name
//            let imageUrl = URL(string: (finalData[0].values![indexPath.row].image_url)!)
//            let imgData = try? Data(contentsOf: imageUrl!)
//            cell.imgOutlt.image = UIImage(data: imgData!)
//            return cell
//
//        case "banners":
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "banner", for: indexPath) as! BannerCollCell
//            let imageUrl = URL(string: (finalData[1].values![indexPath.row].banner_url)!)
//            let imgData = try? Data(contentsOf: imageUrl!)
//            cell.bannerImgOutlt.image = UIImage(data: imgData!)
//            return cell
//
//        case "products":
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "product", for: indexPath) as! ProductCollCell
//            let imageUrl = URL(string: (finalData[2].values![indexPath.row].image)!)
//            let imgData = try? Data(contentsOf: imageUrl!)
//            cell.imgOutlt.image = UIImage(data: imgData!)
//            cell.firstPrice.text = finalData[2].values![indexPath.row].actualPrice
//            cell.secondPrice.text = finalData[2].values![indexPath.row].offerPrice
//            cell.descriptionOutlt.text = finalData[2].values![indexPath.row].name
//
//
//
//            return cell
//
//        default : return UICollectionViewCell()
//        }

//No Of Sections

//let sectionCount = finalData[section].type
//switch sectionCount {
//case "category":
//    return finalData[0].values!.count
//case "banners":
//    return finalData[1].values!.count
//case "products":
//    return finalData[2].values!.count
//default: return finalData.count
//}
