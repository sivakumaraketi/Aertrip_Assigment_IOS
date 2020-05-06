//
//  TableViewCell.swift
//  Aertrip_Assignment
//
//  Created by Amsys on 07/03/20.
//  Copyright © 2020 SivaKumarAketi. All rights reserved.
//

import UIKit

//This class cell is related to main tableview
class TableViewCell: UITableViewCell{
    
    var mySelectedSec = 0
    
    @IBOutlet weak var myTableLbl: UILabel!
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
    
    var collectionViewOffset: CGFloat {
        get {
            return myCollectionView.contentOffset.x
        }

        set {
            myCollectionView.contentOffset.x = newValue
        }
    }
    
    //for available collectionview details in tableview
    func setCollectionViewDataSourceDelegate<D: UICollectionViewDataSource & UICollectionViewDelegate>(_ dataSourceDelegate: D, forRow row: Int) {
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 100, height: 80)
        flowLayout.minimumLineSpacing = 5.0
        flowLayout.minimumInteritemSpacing = 20.0
        self.myCollectionView.collectionViewLayout = flowLayout

        myCollectionView.delegate = dataSourceDelegate
        myCollectionView.dataSource = dataSourceDelegate
       myCollectionView.tag = row
        myCollectionView.setContentOffset(myCollectionView.contentOffset, animated:false) // Stops collection view if it was scrolling.
        myCollectionView.reloadData()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        myCollectionView.allowsMultipleSelection = false
        myCollectionView.allowsSelection = true
                 
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

