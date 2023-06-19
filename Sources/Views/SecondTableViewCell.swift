//
//  SecondTableViewCell.swift
//  Machine Test
//
//  Created by Akshai K on 19/06/23.
//

import UIKit

class SecondTableViewCell: UITableViewCell {

    @IBOutlet weak var seconCollOutlt: UICollectionView!
    
   
    var SecondFinalData:[HomeData] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        seconCollOutlt.delegate = self
        seconCollOutlt.dataSource = self
        seconCollOutlt.reloadData()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension SecondTableViewCell: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return SecondFinalData[1].values!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "banner", for: indexPath) as! BannerCollCell
                    let imageUrl = URL(string: (SecondFinalData[1].values![indexPath.row].banner_url)!)
                    let imgData = try? Data(contentsOf: imageUrl!)
                    cell.bannerImgOutlt.image = UIImage(data: imgData!)
                    return cell
    }
    
    
}
