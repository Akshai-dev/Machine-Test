//
//  ThirdTableViewCell.swift
//  Machine Test
//
//  Created by Akshai K on 19/06/23.
//

import UIKit

class ThirdTableViewCell: UITableViewCell {

    @IBOutlet weak var thirdCollOutlt: UICollectionView!
   
    
    var thirdFinalData:[HomeData] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        thirdCollOutlt.delegate = self
        thirdCollOutlt.dataSource = self
        thirdCollOutlt.reloadData()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension ThirdTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return thirdFinalData[2].values!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "product", for: indexPath) as! ProductCollCell
                    let imageUrl = URL(string: (thirdFinalData[2].values![indexPath.row].image)!)
                    let imgData = try? Data(contentsOf: imageUrl!)
                    cell.imgOutlt.image = UIImage(data: imgData!)
                    cell.firstPrice.text = thirdFinalData[2].values![indexPath.row].actualPrice
                    cell.secondPrice.text = thirdFinalData[2].values![indexPath.row].offerPrice
                    cell.descriptionOutlt.text = thirdFinalData[2].values![indexPath.row].name
        
                    return cell
    }
    
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 170, height: 500)
        }
    }

