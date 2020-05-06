//
//  FooterTableViewCell.swift
//  Aertrip_Assignment
//
//  Created by Amsys on 08/03/20.
//  Copyright © 2020 SivaKumarAketi. All rights reserved.
//

import UIKit

//for buttons
protocol FooterButtonsDelegate: class {
    func footerTapped(at index:IndexPath)
   
}

//This class cell is related to footer in tableview
class FooterTableViewCell: UITableViewCell {
    
    var footerDelegate:FooterButtonsDelegate!
    var indexPath:IndexPath!
    
    @IBOutlet weak var footerView: CustomView!
    @IBAction func footerBtn(_ sender: Any) {
        self.footerDelegate?.footerTapped(at: indexPath)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        /*let bottomBorder = CALayer()
        bottomBorder.frame = CGRect(x: 0.0, y: footerView.frame.size.height-1, width: footerView.frame.width, height: 1.0)
        bottomBorder.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        footerView.layer.addSublayer(bottomBorder)*/
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
