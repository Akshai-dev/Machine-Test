//
//  MainTableView.swift
//  Machine Test
//
//  Created by Akshai K on 15/06/23.
//

import UIKit

class MainTableView: UITableViewCell {
    
    var Apicall = UserviewModel()
   
    @IBOutlet weak var collViewOutlt: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension MainTableView: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collCell", for: indexPath) as! ProductCollCell

        cell.lblOutlt.text

    }


}
