//
//  HeaderTableViewCell.swift
//  Aertrip_Assignment
//
//  Created by Amsys on 08/03/20.
//  Copyright © 2020 SivaKumarAketi. All rights reserved.
//

import UIKit

//for buttons
protocol HeaderButtonsDelegate: class {
    func headerTapped(at index:Int)
   
}
//This class cell is related to header in tableview
class HeaderTableViewCell: UITableViewCell {
    @IBOutlet weak var flightLbl: UILabel!
    @IBOutlet weak var myBtn: UIButton!
    
    var myDelegate:HeaderButtonsDelegate!
       var indexPath:Int!

    @IBAction func headerViewClick(_ sender: Any) {
        self.myDelegate?.headerTapped(at: indexPath)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
