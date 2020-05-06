//
//  SecondTaskViewController.swift
//  Aertrip_Assignment
//
//  Created by Amsys on 07/03/20.
//  Copyright © 2020 SivaKumarAketi. All rights reserved.
//

import UIKit

//This class is related to second task
class SecondTaskViewController: UIViewController, HeaderButtonsDelegate, FooterButtonsDelegate {
    
    //for footer
    func footerTapped(at index: IndexPath) {
        expandRow = false
        swipeIndex = 0
        DispatchQueue.main.async {
            self.myTableView.reloadData()
           // self.myTableView.reloadSections([1, 2, 3], with: .none)
        }
        
    }
    
    //for header
    func headerTapped(at index: Int) {
        print("index:\(index)")
        selectedSec = index
        swipeIndex = 0
        let collapsed = myArray[index].collapsed
        // Toggle collapse
        myArray[index].collapsed = !collapsed!
        if myArray[index].collapsed == true {
            expandRow = true
            
        } else {
            expandRow = false
        }
        DispatchQueue.main.async {
            
            self.myTableView.reloadData()
        }
    }
    
    @IBOutlet weak var myTableView: UITableView!
   
    var selectedSec = 0
    var selectedIndex = Int ()
    var expandRow = false
    var myRowCount = 1
    var myHeaderHeight = 50
    var myFooterHeight = CGFloat.leastNonzeroMagnitude
    var myCollectionViewHeight = 50
    var swipeTableView = false
    var swipeIndex = 0
    var previousSelected : IndexPath?
    var storedOffsets = [Int: CGFloat]()
    var whichCellSelect : Int = 0
    
    var myArray = [TableModel]()
    
    override func viewDidLoad() {
        //Dynamic array
        myArray = [TableModel(items: ["1","2","3","4"]),TableModel(items: ["5","6","7","8","9","10"]),TableModel(items: ["11","12","13","14","15"])]
        super.viewDidLoad()
        self.myTableView.remembersLastFocusedIndexPath = true
        self.navigationController?.navigationBar.isHidden = false
        myTableView.delegate = self
        myTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
   
    
}

// extension for collection view delegate and data source
extension SecondTaskViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myArray[collectionView.tag].items.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCollectionCell", for: indexPath) as! MyCollectionViewCell
        cell.myCollectionLbl.text = myArray[collectionView.tag].items[indexPath.row]
        return cell
    }
    func myLabel(cLabel: String,section: Int) {
        print("section:\(section)--\(selectedSec)")
        let indexPath = IndexPath(row: 0, section: section) //Set your row and section
                   if let cell = myTableView.cellForRow(at: indexPath) as? TableViewCell {
                       //access cell
                    if cell.mySelectedSec == section {
                       cell.myTableLbl.text = cLabel
                    }
                       
                   }
       /* if selectedSec == section {
            let indexPath = IndexPath(row: 0, section: section) //Set your row and section
            if let cell = myTableView.cellForRow(at: indexPath) as? TableViewCell {
                //access cell
                
                cell.myTableLbl.text = cLabel
            }
        } else if selectedSec == section && expandRow == true {
          /* let selectedRows = myTableView.indexPathsForSelectedRows

            myTableView.reloadData()

            DispatchQueue.main.async {
                selectedRows?.forEach { selectedRow in
                    self.myTableView.selectRow(at: selectedRow, animated: false, scrollPosition: .none)
                }
            }*/
        }*/

        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // selectedIndex = indexPath.row
        print("collecsec:\(indexPath.section)--\(selectedSec)")
        //  let myIndexPath = IndexPath(row: indexPath.row, section: indexPath.section)
        let mycell = collectionView.cellForItem(at: indexPath) as? MyCollectionViewCell
        collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .top)
        collectionView.delegate = self
        var firstTime = true
         myLabel(cLabel: (mycell?.myCollectionLbl.text)!, section: collectionView.tag)
       /* if expandRow == false {
            firstTime = false
            myLabel(cLabel: (mycell?.myCollectionLbl.text)!, section: collectionView.tag)
        } else  {
            myTableView.reloadData()
             let indexPath = IndexPath(row: 0, section: collectionView.tag) //Set your row and section
                if let cell = myTableView.cellForRow(at: indexPath) as? TableViewCell {
                                  //access cell
                                  
                    cell.myTableLbl.text = mycell?.myCollectionLbl.text
            }
        }*/
        
       
        
    }
    
}

// extension for table view delegate and data source
extension SecondTaskViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        swipeTableView = false
        let cell = myTableView.dequeueReusableCell(withIdentifier: "HeaderCell") as! HeaderTableViewCell
        // let indexPath = IndexPath(row: 0, section: section)
        cell.myDelegate = self
        cell.indexPath = section
        if myArray[section].collapsed == true {
            myFooterHeight = CGFloat.leastNormalMagnitude
            if #available(iOS 13.0, *) {
                let image = UIImage(systemName: "chevron.up")
                cell.myBtn.setImage(image, for: .normal)
            }
        } else {
            myFooterHeight = CGFloat.leastNonzeroMagnitude
            if #available(iOS 13.0, *) {
                let image = UIImage(systemName: "chevron.down")
                cell.myBtn.setImage(image, for: .normal)
            }
        }
        
        cell.flightLbl.text = "\(myArray[section].items.count) flights are at same price"
        return cell
    }
    
    
    //for footer
     func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
     let cell = myTableView.dequeueReusableCell(withIdentifier: "FooterCell") as! FooterTableViewCell
     let indexPath = IndexPath(row: 0, section: section)
     cell.footerDelegate = self
     cell.indexPath = indexPath
     return cell
     }
    
    //for header height
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    // for footer height
     func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
     print("selectedSec:\(selectedSec)---\(expandRow)")
     if selectedSec == section && expandRow == true {
     return 50
     }
        print("myFooterHeight:\(myFooterHeight)")
        return myFooterHeight
     }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if selectedSec == section && expandRow == true {
            return myArray[section].items.count
        } else {
            return 1
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return myArray.count
        
    }
    
    private func tableView(tableView: UITableView,
                           didEndDisplayingCell cell: UITableViewCell,
                           forRowAtIndexPath indexPath: NSIndexPath) {
        
        guard let tableViewCell = cell as? TableViewCell else { return }
        
        storedOffsets[indexPath.row] = tableViewCell.collectionViewOffset
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        guard let tableViewCell = cell as? TableViewCell else { return }
        
        tableViewCell.setCollectionViewDataSourceDelegate(self, forRow: [indexPath.section][indexPath.row])
        tableViewCell.collectionViewOffset = storedOffsets[indexPath.row] ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if selectedSec == indexPath.section && expandRow == true {
            let cell = myTableView.dequeueReusableCell(withIdentifier: "UpdateTableViewCell", for: indexPath) as! UpdateTableViewCell
            cell.updateLbl.layer.masksToBounds = true
            cell.updateLbl.layer.cornerRadius = 15
            cell.updateLbl?.isUserInteractionEnabled = false
            cell.updateLbl.text = myArray[selectedSec].items[indexPath.row]
            return cell
        } else  {
            let myCell = myTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
            myCell.myTableLbl?.isUserInteractionEnabled = true
            myCell.mySelectedSec = indexPath.section
            myCell.myTableLbl.layer.masksToBounds = true
            myCell.myTableLbl.layer.cornerRadius = 15
            let directions: [UISwipeGestureRecognizer.Direction] = [.right, .left]
            if let collectionView = myCell.myCollectionView,
                let indexPath = collectionView.indexPathsForSelectedItems?.first,
                let cell = collectionView.cellForItem(at: indexPath) as? MyCollectionViewCell {
                myCell.myTableLbl.text = cell.myCollectionLbl.text
            } else {
                
                myCell.myTableLbl.text = myArray[indexPath.section].items[swipeIndex]
            }
            
            myCell.myTableLbl.tag = indexPath.section
            for direction in directions {
                let tapGesture1 = UISwipeGestureRecognizer(target: self, action: #selector(labelSwipedLeft(swipeGesture:)))
                tapGesture1.direction = direction
                myCell.myTableLbl?.addGestureRecognizer(tapGesture1)
            }
            myCell.myTableLbl.isUserInteractionEnabled = true
            
            return myCell
        }
        
        
        
    }
    
    //for handling left and right swipe for a label
    @objc func labelSwipedLeft(swipeGesture: UISwipeGestureRecognizer) {
        swipeTableView = true
        
        let view = swipeGesture.view as! UILabel
        
        let tag = swipeGesture.view!.tag
        
        let indexPath = IndexPath(row:view.tag, section: tag)
        if  swipeIndex < myArray[indexPath.section].items.count - 1 && swipeIndex >= 0  {
            
            // swipeIndex = swipeIndex + 1
            
            if swipeGesture.direction.rawValue == 2 {
                
                swipeIndex = swipeIndex + 1
                
            } else if  swipeGesture.direction.rawValue == 1 {
                if swipeIndex > 0 {
                    swipeIndex = swipeIndex - 1
                }
            }
            view.text = myArray[indexPath.section].items[swipeIndex]
            
        } else {
            swipeIndex = 0
            swipeTableView = false
        }
    }
    
    
}


