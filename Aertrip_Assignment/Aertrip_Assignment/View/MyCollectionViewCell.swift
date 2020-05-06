//
//  MyCollectionViewCell.swift
//  Aertrip_Assignment
//
//  Created by Amsys on 07/03/20.
//  Copyright © 2020 SivaKumarAketi. All rights reserved.
//

import UIKit

//This class cell is related to  collectionview
class MyCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var myCollectionLbl: UILabel!
    
    @IBOutlet weak var cView: UIView!
    
    override var isSelected: Bool {
        didSet {
            cView.backgroundColor = isSelected ? UIColor.red: UIColor.clear
            
        }
    }
    
 
   
    
    override func awakeFromNib() {
         cView.layer.cornerRadius = 40
         cView.layer.masksToBounds = true
    
       
    }
    
   
}
