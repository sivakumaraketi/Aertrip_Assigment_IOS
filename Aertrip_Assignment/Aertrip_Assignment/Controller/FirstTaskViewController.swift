//
//  ViewController.swift
//  Aertrip_Assignment
//
//  Created by Amsys on 07/03/20.
//  Copyright © 2020 SivaKumarAketi. All rights reserved.
//

import UIKit

//This class is related to first task
class FirstTaskViewController: UIViewController {
    
    var leftSwipe = UISwipeGestureRecognizer()
    
    @IBOutlet weak var menuView: UIView!
    
    //second task action
    @IBAction func secondTask(_ sender: Any) {
        performSegue(withIdentifier: "secondTask", sender: nil)
    }
    
    // for menu animation
    @IBAction func myMenuBtn(_ sender: Any) {
        closeSideMenu()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //gesture handling
        leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
        leftSwipe.direction = .right
        view.addGestureRecognizer(leftSwipe)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    //gesture swipe action
    @objc func handleSwipes(_ sender: UISwipeGestureRecognizer) {
        OpenSideMenu()
    }
    
    // open action
    @objc func OpenSideMenu(){
        UIView.animate(withDuration: 0.9) {
            let layer = self.menuView.layer
            var rotationAndPerspectiveTransform = CATransform3DIdentity
            self.menuView.layer.borderWidth = 0
            self.menuView.layer.shadowOpacity = 0.0
            self.menuView.layer.cornerRadius = 0
            rotationAndPerspectiveTransform = CATransform3DRotate(rotationAndPerspectiveTransform, 0.0, 0.0, 0.0, 0.0)
            self.menuView.layer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            layer.transform = rotationAndPerspectiveTransform
            
        }
    }
    
    // close action
    @objc func closeSideMenu() {
        UIView.animate(withDuration: 0.9) {
            let layer = self.menuView.layer
            var rotationAndPerspectiveTransform = CATransform3DIdentity
            rotationAndPerspectiveTransform.m14 = -1 / 2000
            
            self.menuView.layer.shadowOffset = CGSize(width: 100.5, height: 1.4)  //Here you control x and y
            self.menuView.layer.masksToBounds =  false
            
            self.menuView.layer.borderWidth = 5
            self.menuView.layer.shadowOpacity = 0.1
            self.menuView.layer.cornerRadius = 20
            self.menuView.layer.borderColor = UIColor.darkGray.cgColor
            rotationAndPerspectiveTransform = CATransform3DRotate(rotationAndPerspectiveTransform, 45.0 * .pi / 180.0, 0.0, -45.0 * .pi / 180.0, 0.0)
            self.menuView.layer.anchorPoint = CGPoint(x: 1.4, y: 0.5)
            layer.transform = rotationAndPerspectiveTransform
        }
    }
    
}
